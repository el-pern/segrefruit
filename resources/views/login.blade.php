<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SegreFruit | Login</title>

    <link rel="icon" type="image/x-icon" href="{{ asset('SEGRE_ICON.png') }}">

    <link href="https://fonts.googleapis.com/css2?family=Fraunces:wght@400;700;900&family=DM+Sans:wght@400;500;600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
        crossorigin="anonymous">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=DM+Mono:wght@400;500&family=Syne:wght@600;700;800&display=swap" rel="stylesheet">

    <style>
        :root {
            --bg:         #f5f0e8;
            --surface:    #fdfaf4;
            --border:     #e2d9c8;
            --border-dark:#c9bda8;
            --text:       #2c1a0e;
            --muted:      #8a6e56;
            --accent:     #d94f2b;
            --accent-dim: rgba(217,79,43,.1);
            --green:      #6aaa3a;
            --green-dim:  rgba(106,170,58,.12);
            --radius:     10px;
            --font-head:  'Syne', sans-serif;
            --font-mono:  'DM Mono', monospace;
            --shadow:     0 2px 12px rgba(44,26,14,.08);
        }

        * { box-sizing: border-box; margin: 0; padding: 0; }

        body {
            min-height: 100vh;
            background: #1a0e0a;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'DM Sans', sans-serif;
            padding: 2rem;
            position: relative;
            overflow: hidden;
        }

        body::before {
            content: '';
            position: fixed;
            width: 500px; height: 500px;
            top: -180px; right: -120px;
            border-radius: 50%;
            background: #e8401a;
            opacity: 0.07;
            pointer-events: none;
        }

        body::after {
            content: '';
            position: fixed;
            width: 320px; height: 320px;
            bottom: -100px; left: -80px;
            border-radius: 50%;
            background: #e8401a;
            opacity: 0.07;
            pointer-events: none;
        }

        .login-card {
            background: #f5ede3;
            border-radius: 24px;
            width: 100%;
            max-width: 440px;
            padding: 2.5rem 2.5rem 2rem;
            position: relative;
        }

        .login-card-stripe {
            position: absolute;
            top: 0; left: 0; right: 0;
            height: 6px;
            background: #e8401a;
            border-radius: 24px 24px 0 0;
        }

        .logo-area {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 14px;
            margin-bottom: 2rem;
        }

        .logo-badge {
            width: 52px; height: 52px;
            background: #e8401a;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
        }

        .logo-image{
            width:150px;
            height:150px;
        }

        .brand {
            font-family: var(--font-head);
            font-size: 1.6rem;
            font-weight: 800;
            letter-spacing: -0.03em;
            color: var(--text);
            display: flex;
            align-items: center;
            gap: .5rem;
        }

        .brand span { color: var(--accent); }

        .logo-sub {
            font-size: 11px;
            font-weight: 500;
            color: #8c4b2f;
            letter-spacing: 2px;
            text-transform: uppercase;
            margin-top: 2px;
            display: block;
        }

        .login-divider {
            height: 1px;
            background: #d9c4b0;
            margin-bottom: 1.75rem;
            border: none;
        }

        .login-heading {
            font-family: 'Fraunces', serif;
            font-size: 28px;
            font-weight: 700;
            color: #2b0f08;
            margin-bottom: 4px;
            letter-spacing: -0.5px;
        }

        .login-subheading {
            font-size: 14px;
            color: #8c6855;
            margin-bottom: 1.75rem;
        }

        .form-group {
            margin-bottom: 1.1rem;
        }

        .form-group label {
            display: block;
            font-size: 12px;
            font-weight: 600;
            color: #5e2e1a;
            letter-spacing: 1px;
            text-transform: uppercase;
            margin-bottom: 6px;
        }

        .form-group label .required {
            color: #e8401a;
            margin-left: 2px;
        }

        .form-group input {
            width: 100%;
            padding: 10px 14px;
            border: 1.5px solid #c9a98e;
            border-radius: 10px;
            font-family: 'DM Sans', sans-serif;
            font-size: 14px;
            color: #2b0f08;
            background: #fff8f2;
            outline: none;
            transition: border-color 0.2s, box-shadow 0.2s;
        }

        .form-group input::placeholder { color: #c0907a; }

        .form-group input:focus {
            border-color: #e8401a;
            box-shadow: 0 0 0 3px rgba(232, 64, 26, 0.12);
        }

        .forgot-link {
            display: block;
            text-align: right;
            font-size: 12px;
            color: #8c4b2f;
            text-decoration: none;
            margin-top: -4px;
            margin-bottom: 1.25rem;
        }

        .forgot-link:hover { color: #e8401a; text-decoration: underline; }

        .btn-login {
            width: 100%;
            padding: 13px;
            background: #e8401a;
            color: #ffffff;
            font-family: 'DM Sans', sans-serif;
            font-size: 15px;
            font-weight: 700;
            border: none;
            border-radius: 12px;
            cursor: pointer;
            letter-spacing: 0.4px;
            transition: background 0.2s, transform 0.1s;
            margin-top: 4px;
        }

        .btn-login:hover { background: #c73514; }
        .btn-login:active { transform: scale(0.98); }

        .login-footer {
            text-align: center;
            font-size: 12px;
            color: #8c6855;
            margin-top: 1.25rem;
        }

        .login-footer a {
            color: #e8401a;
            font-weight: 600;
            text-decoration: none;
        }

        .login-footer a:hover { text-decoration: underline; }

        .estd-tag {
            position: absolute;
            bottom: -1px; right: 20px;
            font-family: 'Fraunces', serif;
            font-size: 10px;
            font-weight: 700;
            color: #c9a98e;
            letter-spacing: 1.5px;
            text-transform: uppercase;
            background: #f5ede3;
            padding: 2px 8px;
            border-radius: 6px 6px 0 0;
            border: 1px solid #d9c4b0;
            border-bottom: none;
        }

        .text-danger {
            font-size: 12px;
            color: #c0392b !important;
            margin-top: 4px;
        }
    </style>
</head>
<body>

    <div class="login-card">
        <div class="login-card-stripe"></div>

        <div class="logo-area">
            <div>
                <img class="logo-image" src="{{ asset('SEGRE_ICON.png') }}">
            </div>
        </div>

        <hr class="login-divider">

        <p class="login-heading">Welcome back</p>
        <p class="login-subheading">Sign in to your account to continue</p>

        <form action="/segrefruit/login" method="POST">
            @csrf

            <div class="form-group">
                <label for="email">Username <span class="required">*</span></label>
                <input type="text" name="email" id="email" required>
                @error('email')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>

            <div class="form-group">
                <label for="password">Password <span class="required">*</span></label>
                <input type="password" name="password" id="password" required>
                @error('password')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>

            <button type="submit" class="btn-login">Sign In</button>
        </form>


    </div>

</body>
</html>