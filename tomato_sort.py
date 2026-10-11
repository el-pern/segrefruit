import os
os.environ["TORCH_NNPACK"] = "0"

import cv2
import time
import RPi.GPIO as GPIO
from ultralytics import YOLO
from collections import deque

# ============================================================
# CONFIGURATION
# ============================================================

MODEL_PATH   = 'kamatis_11n_426.pt'
CAM1_INDEX   = 0
CAM2_INDEX   = 1
CONF_THRESH  = 0.5

# GPIO Pins (BCM)
IN1 = 5
IN2 = 6

# Motor timing (calibrated)
TIME_DEFAULT_TO_LEFT  = 0.3
TIME_LEFT_TO_DEFAULT  = 0.16
TIME_DEFAULT_TO_RIGHT = 0.3
TIME_RIGHT_TO_DEFAULT = 0.14
SPEED = 40

# ── Voting buffer ────────────────────────────────────────────
# How long (seconds) to collect detections before making a decision.
# During this window every frame from both cameras casts a vote.
# After the window closes, whichever class got more votes wins
# (with Reject winning any tie for safety).
VOTE_WINDOW   = 3.0   # seconds

# Minimum number of total votes required to act.
# Prevents a decision when the tomato was barely visible.
MIN_VOTES     = 5

# Cooldown after a sort action before a new window can open.
COOLDOWN      = 2.0   # seconds
# ─────────────────────────────────────────────────────────────

# ============================================================
# GPIO / MOTOR SETUP
# ============================================================

GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)
GPIO.setup(IN1, GPIO.OUT)
GPIO.setup(IN2, GPIO.OUT)

pwm1 = GPIO.PWM(IN1, 1000)
pwm1.start(0)
pwm2 = GPIO.PWM(IN2, 1000)
pwm2.start(0)


def motor_forward(speed=SPEED):
    pwm2.ChangeDutyCycle(0)
    GPIO.output(IN2, GPIO.LOW)
    pwm1.ChangeDutyCycle(speed)

def motor_backward(speed=SPEED):
    pwm1.ChangeDutyCycle(0)
    GPIO.output(IN1, GPIO.LOW)
    pwm2.ChangeDutyCycle(speed)

def motor_stop():
    pwm1.ChangeDutyCycle(0)
    pwm2.ChangeDutyCycle(0)
    GPIO.output(IN1, GPIO.LOW)
    GPIO.output(IN2, GPIO.LOW)

def go_left():
    print("  [Motor] → LEFT (Healthy)")
    motor_forward(SPEED)
    time.sleep(TIME_DEFAULT_TO_LEFT)
    motor_stop()
    time.sleep(0.8)
    print("  [Motor] → RETURNING to DEFAULT from left")
    motor_backward(SPEED)
    time.sleep(TIME_LEFT_TO_DEFAULT)
    motor_stop()

def go_right():
    print("  [Motor] → RIGHT (Reject)")
    motor_backward(SPEED)
    time.sleep(TIME_DEFAULT_TO_RIGHT)
    motor_stop()
    time.sleep(0.8)
    print("  [Motor] → RETURNING to DEFAULT from right")
    motor_forward(SPEED)
    time.sleep(TIME_RIGHT_TO_DEFAULT)
    motor_stop()


# ============================================================
# YOLO MODEL
# ============================================================

print("Loading YOLO model...")
model = YOLO(MODEL_PATH, task='detect')
labels = model.names
print(f"Classes: {labels}\n")


# ============================================================
# CAMERA SETUP
# ============================================================

print("Opening cameras...")
cap1 = cv2.VideoCapture(CAM1_INDEX)
cap2 = cv2.VideoCapture(CAM2_INDEX)

if not cap1.isOpened():
    print(f"ERROR: Could not open Camera 1 (index {CAM1_INDEX})")
    GPIO.cleanup()
    exit(1)

if not cap2.isOpened():
    print(f"ERROR: Could not open Camera 2 (index {CAM2_INDEX})")
    GPIO.cleanup()
    exit(1)

print("Both cameras opened successfully.\n")


# ============================================================
# DETECTION HELPER
# ============================================================

def get_top_detection(frame):
    """Return (classname, confidence) of highest-confidence detection, or (None, 0)."""
    results    = model(frame, verbose=False)
    detections = results[0].boxes

    best_class = None
    best_conf  = 0.0

    for det in detections:
        conf = det.conf.item()
        if conf >= CONF_THRESH and conf > best_conf:
            best_conf  = conf
            best_class = labels[int(det.cls.item())]

    return best_class, best_conf


def draw_ui(frame1, frame2, label1, conf1, label2, conf2,
            vote_healthy, vote_reject, state, countdown):
    """Compose the side-by-side preview with vote counts and state."""

    def annotate(f, label, conf):
        color = (0, 255, 0) if label == "Healthy" else \
                (0, 0, 255) if label == "Reject"  else (128, 128, 128)
        text  = f"{label} {conf:.0%}" if label else "No detection"
        cv2.putText(f, text, (10, 40), cv2.FONT_HERSHEY_SIMPLEX, 1.0, color, 2)
        return f

    frame1 = annotate(frame1, label1, conf1)
    frame2 = annotate(frame2, label2, conf2)

    h  = min(frame1.shape[0], frame2.shape[0])
    f1 = cv2.resize(frame1, (640, h))
    f2 = cv2.resize(frame2, (640, h))
    combined = cv2.hconcat([f1, f2])

    # Camera labels
    cv2.putText(combined, "Cam 1", (10, 25),
                cv2.FONT_HERSHEY_SIMPLEX, 0.7, (255, 255, 0), 2)
    cv2.putText(combined, "Cam 2", (650, 25),
                cv2.FONT_HERSHEY_SIMPLEX, 0.7, (255, 255, 0), 2)

    # Vote tally
    total = vote_healthy + vote_reject
    cv2.putText(combined,
                f"Votes  Healthy:{vote_healthy}  Reject:{vote_reject}  Total:{total}",
                (10, h - 50), cv2.FONT_HERSHEY_SIMPLEX, 0.65, (255, 255, 255), 2)

    # State / countdown
    if state == "voting":
        state_text  = f"VOTING... {countdown:.1f}s left"
        state_color = (0, 220, 255)
    elif state == "cooldown":
        state_text  = f"COOLDOWN {countdown:.1f}s"
        state_color = (180, 180, 180)
    else:
        state_text  = "WAITING for tomato..."
        state_color = (200, 200, 200)

    cv2.putText(combined, state_text, (10, h - 15),
                cv2.FONT_HERSHEY_SIMPLEX, 0.85, state_color, 2)

    return combined


# ============================================================
# VOTING BUFFER
# ============================================================

vote_healthy   = 0
vote_reject    = 0
vote_start     = None   # timestamp when current window opened
last_sort_time = 0.0
state          = "waiting"   # "waiting" | "voting" | "cooldown"


def reset_votes():
    global vote_healthy, vote_reject
    vote_healthy = 0
    vote_reject  = 0


def cast_votes(label1, label2):
    """Add this frame's detections to the running totals."""
    global vote_healthy, vote_reject
    for label in [label1, label2]:
        if label == "Healthy":
            vote_healthy += 1
        elif label == "Reject":
            vote_reject += 1


def tally_decision():
    """
    Return final decision from accumulated votes.
    Reject wins ties (safety-first).
    Returns None if not enough votes collected.
    """
    total = vote_healthy + vote_reject
    if total < MIN_VOTES:
        print(f"  [Vote] Only {total} votes — not enough to decide. Skipping.")
        return None
    if vote_reject >= vote_healthy:   # tie goes to Reject
        return "Reject"
    return "Healthy"


# ============================================================
# MAIN LOOP
# ============================================================

print("=== Tomato Sorter Running ===")
print(f"Vote window: {VOTE_WINDOW}s | Min votes: {MIN_VOTES} | Cooldown: {COOLDOWN}s")
print("Press 'q' to quit, 's' to snapshot.\n")

try:
    while True:
        ret1, frame1 = cap1.read()
        ret2, frame2 = cap2.read()

        if not ret1 or not ret2:
            print("Warning: Could not read from one or both cameras.")
            time.sleep(0.1)
            continue

        now = time.time()

        # ── Detect ──────────────────────────────────────────
        label1, conf1 = get_top_detection(frame1)
        label2, conf2 = get_top_detection(frame2)

        either_detected = (label1 is not None) or (label2 is not None)

        # ── State machine ────────────────────────────────────
        countdown = 0.0

        if state == "cooldown":
            elapsed_cd = now - last_sort_time
            countdown  = max(0.0, COOLDOWN - elapsed_cd)
            if elapsed_cd >= COOLDOWN:
                state = "waiting"
                print("  [State] → WAITING")

        elif state == "waiting":
            if either_detected:
                # A tomato appeared — open the voting window
                state      = "voting"
                vote_start = now
                reset_votes()
                cast_votes(label1, label2)
                print(f"  [State] → VOTING window opened")

        elif state == "voting":
            if vote_start is None:
                vote_start = now
            cast_votes(label1, label2)
            elapsed_v = now - vote_start
            countdown = max(0.0, VOTE_WINDOW - elapsed_v)

            if elapsed_v >= VOTE_WINDOW:
                # Window closed — make decision
                decision = tally_decision()
                print(f"  [Vote] Healthy:{vote_healthy}  Reject:{vote_reject}  → {decision}")

                if decision is not None:
                    if decision == "Healthy":
                        go_left()
                    else:
                        go_right()

                last_sort_time = time.time()
                state = "cooldown"
                reset_votes()
                vote_start = None
                print(f"  [State] → COOLDOWN")

        # ── Display ──────────────────────────────────────────
        combined = draw_ui(frame1, frame2,
                           label1, conf1, label2, conf2,
                           vote_healthy, vote_reject,
                           state, countdown)
        cv2.imshow("Tomato Sorter", combined)

        key = cv2.waitKey(1) & 0xFF
        if key == ord('q') or key == ord('Q'):
            print("Quit requested.")
            break
        elif key == ord('s'):
            cv2.imwrite('snapshot.png', combined)
            print("Snapshot saved.")

except KeyboardInterrupt:
    print("\nInterrupted by user.")

finally:
    print("Cleaning up...")
    motor_stop()
    pwm1.stop()
    pwm2.stop()
    GPIO.cleanup()
    cap1.release()
    cap2.release()
    cv2.destroyAllWindows()
    print("Done.")
