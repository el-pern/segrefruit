@extends('Layouts.app')
@section('content')

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SegreFruit</title>

    <link rel="icon" type="image/x-icon" href="{{ asset('SEGRE_ICON.png') }}">

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

        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

        body {
            background: var(--bg);
            color: var(--text);
            font-family: var(--font-mono);
            min-height: 100vh;
            padding: 2rem;
        }

        .topbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 2.5rem;
            gap: 1rem;
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
        .brand-icon {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 34px; height: 34px;
            background: var(--accent);
            border-radius: 50%;
            font-size: 1.1rem;
            flex-shrink: 0;
        }
        .brand span { color: var(--accent); }

        .topbar-actions { display: flex; gap: .6rem; flex-wrap: wrap; align-items: center; }

        /* Buttons */
        .btn-sf {
            font-family: var(--font-mono);
            font-size: .75rem;
            font-weight: 500;
            letter-spacing: .04em;
            text-transform: uppercase;
            border: 1.5px solid var(--border-dark);
            background: var(--surface);
            color: var(--muted);
            border-radius: var(--radius);
            padding: .45rem 1rem;
            cursor: pointer;
            transition: all .14s;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: .4rem;
            white-space: nowrap;
            box-shadow: var(--shadow);
        }
        .btn-sf:hover { background: #fff; color: var(--text); border-color: var(--accent); transform: translateY(-1px); box-shadow: 0 4px 16px rgba(44,26,14,.12); }
        .btn-sf:active { transform: translateY(0); }

        .btn-sf.accent { background: var(--accent); border-color: var(--accent); color: #fff; }
        .btn-sf.accent:hover { background: #c4411f; border-color: #c4411f; color: #fff; }

        .btn-sf.ghost-green { background: var(--green-dim); border-color: var(--green); color: #3d7a1a; }
        .btn-sf.ghost-green:hover { background: rgba(106,170,58,.22); color: #2d5c12; border-color: #5a9830; }

        .btn-sf.danger { background: var(--accent-dim); border-color: var(--accent); color: var(--accent); }
        .btn-sf.danger:hover { background: rgba(217,79,43,.18); }

        /* Table */
        .table-wrap {
            background: var(--surface);
            border: 1.5px solid var(--border);
            border-radius: 14px;
            overflow: hidden;
            box-shadow: var(--shadow);
            animation: fadeUp .3s ease both;
        }
        .table-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 1rem 1.4rem;
            border-bottom: 1.5px solid var(--border);
            background: linear-gradient(to right, rgba(217,79,43,.05), transparent);
        }
        .table-title { font-family: var(--font-head); font-size: 1rem; font-weight: 700; }
        .table-badge {
            font-size: .65rem;
            font-family: var(--font-mono);
            background: var(--accent-dim);
            color: var(--accent);
            border: 1px solid rgba(217,79,43,.3);
            padding: .18rem .55rem;
            border-radius: 6px;
            letter-spacing: .08em;
        }

        table.sf-table { width: 100%; border-collapse: collapse; font-size: .82rem; }
        table.sf-table thead th {
            padding: .65rem 1.4rem;
            text-align: left;
            font-size: .66rem;
            letter-spacing: .1em;
            text-transform: uppercase;
            color: var(--muted);
            background: rgba(217,79,43,.04);
            border-bottom: 1.5px solid var(--border);
            font-weight: 500;
        }
        table.sf-table tbody tr { border-bottom: 1px solid var(--border); transition: background .12s; }
        table.sf-table tbody tr:last-child { border-bottom: none; }
        table.sf-table tbody tr:hover { background: rgba(217,79,43,.04); }
        table.sf-table tbody td { padding: .8rem 1.4rem; color: var(--text); }
        .dot { display: inline-block; width: 6px; height: 6px; border-radius: 50%; background: var(--accent); margin-right: .5rem; vertical-align: middle; }
        .timestamp-cell { color: var(--muted); font-size: .78rem; }

        /* Modals */
        .modal-content {
            background: var(--surface);
            border: 1.5px solid var(--border);
            border-radius: 14px;
            color: var(--text);
            font-family: var(--font-mono);
            box-shadow: 0 8px 40px rgba(44,26,14,.16);
        }
        .modal-header { border-bottom: 1.5px solid var(--border); padding: 1.1rem 1.4rem; background: linear-gradient(to right, rgba(217,79,43,.05), transparent); }
        .modal-title { font-family: var(--font-head); font-size: 1rem; font-weight: 700; }
        .modal-footer { border-top: 1.5px solid var(--border); }
        .modal-body { padding: 1.4rem; }

        .form-control {
            background: var(--bg);
            border: 1.5px solid var(--border-dark);
            border-radius: var(--radius);
            color: var(--text);
            font-family: var(--font-mono);
            font-size: .82rem;
            padding: .55rem .9rem;
            transition: border-color .15s, box-shadow .15s;
        }
        .form-control:focus { background: var(--bg); border-color: var(--accent); color: var(--text); box-shadow: 0 0 0 3px rgba(217,79,43,.12); outline: none; }
        .form-control::file-selector-button { background: var(--accent); border: none; color: #fff; font-family: var(--font-mono); font-size: .72rem; padding: .35rem .7rem; border-radius: 6px; margin-right: .75rem; cursor: pointer; }

        @keyframes fadeUp {
            from { opacity: 0; transform: translateY(10px); }
            to   { opacity: 1; transform: translateY(0); }
        }

        /* ── Calendar ───────────────────────────────── */
.content-container { 
    display:flex;
    justify-content: center;
    margin-bottom: 2rem;
}

.calendar-section {
    background: var(--surface);
    border: 1.5px solid var(--border);
    border-radius: 14px;
    padding: 1.4rem;
    box-shadow: var(--shadow);
    animation: fadeUp .3s ease both;
    max-width: 420px;
}

.section-heading {
    font-family: var(--font-head);
    font-size: 1.1rem;
    font-weight: 700;
    margin-bottom: 1rem;
}

.calendar-header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-bottom: .75rem;
    gap: .5rem;
}

.calendar-header-center { flex: 1; text-align: center; }

.calendar-header-dropdowns {
    display: flex;
    justify-content: center;
    gap: .4rem;
    margin-bottom: .3rem;
}

#currentMonth {
    font-family: var(--font-head);
    font-size: .82rem;
    font-weight: 700;
    color: var(--muted);
    margin: 0;
}

.month-nav {
    background: var(--surface);
    border: 1.5px solid var(--border-dark);
    border-radius: var(--radius);
    color: var(--text);
    font-size: 1.1rem;
    width: 32px; height: 32px;
    cursor: pointer;
    display: flex; align-items: center; justify-content: center;
    transition: all .14s;
    flex-shrink: 0;
}
.month-nav:hover { background: #fff; border-color: var(--accent); color: var(--accent); }

.date-picker {
    font-family: var(--font-mono);
    font-size: .75rem;
    background: var(--bg);
    border: 1.5px solid var(--border-dark);
    border-radius: var(--radius);
    color: var(--text);
    padding: .25rem .5rem;
    cursor: pointer;
}
.date-picker:focus { outline: none; border-color: var(--accent); box-shadow: 0 0 0 3px rgba(217,79,43,.12); }

.calendar-weekdays {
    display: grid;
    grid-template-columns: repeat(7, 1fr);
    margin-bottom: .3rem;
}
.calendar-weekdays div {
    text-align: center;
    font-size: .63rem;
    letter-spacing: .08em;
    text-transform: uppercase;
    color: var(--muted);
    padding: .3rem 0;
}

.calendar-days {
    display: grid;
    grid-template-columns: repeat(7, 1fr);
    gap: 3px;
}

.calendar-day {
    aspect-ratio: 1;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: .78rem;
    border-radius: 8px;
    transition: background .12s, color .12s;
    user-select: none;
    cursor: default;
}

/* Clickable current-month days */
.calendar-day:not(.other-month) {
    cursor: pointer;
    color: var(--text);
}
.calendar-day:not(.other-month):hover {
    background: var(--accent-dim);
    color: var(--accent);
}

.calendar-day.other-month { color: var(--border-dark); }

.calendar-day.weekend:not(.other-month) { color: var(--accent); }

.calendar-day.today {
    background: var(--accent);
    color: #fff !important;
    font-weight: 700;
    box-shadow: 0 2px 8px rgba(217,79,43,.35);
}

.calendar-day.selected {
    background: var(--text);
    color: #fff !important;
    font-weight: 700;
}

.calendar-day a {
    text-decoration: none;
    color: inherit;
    display: flex;
    align-items: center;
    justify-content: center;
    width: 100%;
    height: 100%;
}

/* Inline date display below grid */
#selectedDateDisplay {
    margin-top: .9rem;
    padding: .65rem 1rem;
    background: var(--bg);
    border: 1.5px solid var(--border);
    border-radius: var(--radius);
    font-size: .78rem;
    display: flex;
    flex-direction: column;
    gap: .2rem;
}
.date-label { color: var(--muted); }
.date-sunday { color: var(--accent); font-weight: 600; font-size: .75rem; }
    </style>
</head>
<body>

    @if(session('success'))
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            {{ session('success') }}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    @endif
    @if(session('error'))
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            {{ session('error') }}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    @endif

    <div class="topbar">
        <div class="brand">
            <img class="logo-image" src="{{ asset('SEGRE_ICON.png') }}">
        </div>
        <div class="topbar-actions">
            <button class="btn-sf ghost-green" data-bs-toggle="modal" data-bs-target="#importModal" title="Import all fruit records (good, damaged) from CSV">↑ Import Fruits From CSV</button>
            <form action="{{ route('fruits.export') }}" method="POST" style="display:inline;">
                @csrf
                <button type="submit" class="btn-sf" title="Export all fruit records (good, damaged) to CSV">↓ Export Fruits to CSV</button>
            </form>
            <button class="btn-sf ghost-green" data-bs-toggle="modal" data-bs-target="#restoreModal" title="Restore database/table records">⭮ Restore SQL Database</button>
            <form action="{{ route('backups.generate') }}" method="POST" style="display:inline;">
                @csrf
                <button type="submit" class="btn-sf" title="Backup database contents">⛁ Backup SQL Database</button>
            </form>            <button class="btn-sf danger" data-bs-toggle="modal" data-bs-target="#logoutModal">➜] Logout</button>
        </div>
    </div>

    <div class="content-container" id="contentWrapper">
        <!-- Calendar Section -->
        <div class="calendar-section">
            <h3 class="section-heading">
                🗓 Calendar
            </h3>

                <div class="text-center mt-3">
                <p style="font-size: 13px; color: #888;">Select Month/Year</p>
                </div>

            <div class="calendar-container">
                <div class="calendar-header">
                    <button class="month-nav" id="prevMonth">‹</button>
                    
                        <div class="calendar-header-center">
                        <div class="calendar-header-dropdowns">
                            <select class="date-picker text-center" id="monthPicker">
                                <option value="1">January</option>
                                <option value="2">February</option>
                                <option value="3">March</option>
                                <option value="4">April</option>
                                <option value="5">May</option>
                                <option value="6">June</option>
                                <option value="7">July</option>
                                <option value="8">August</option>
                                <option value="9">September</option>
                                <option value="10">October</option>
                                <option value="11">November</option>
                                <option value="12">December</option>
                            </select>
                            <select class="date-picker text-center" id="yearPicker">
                                @php

                                    $currentYear = date('Y');
                                    // Build year options (last 10 years)
                                    $yearOptions = '';
                                    for($y = $currentYear; $y >= $currentYear - 10; $y--){
                                        $yearOptions .= "<option value='$y'>$y</option>";
                                    }
                                @endphp
                                <?= $yearOptions ?>
                            </select>
                        </div>
                        <h4 id="currentMonth"></h4>
                    </div>


                    <button class="month-nav" id="nextMonth">›</button>
                </div>
                <p class="text-center" style="margin: 2px 0 3px; font-size: 12px; color: #888;"
                >Select a day to view dashboard</p>
                <div class="calendar-weekdays">
                    <div>Sun</div>
                    <div>Mon</div>
                    <div>Tue</div>
                    <div>Wed</div>
                    <div>Thu</div>
                    <div>Fri</div>
                    <div>Sat</div>
                </div>
                <div class="calendar-days" id="calendarDays"></div>
            </div>
        </div>
    </div>

    <script>
        let currentDate = new Date();
    let selectedDate = null;
    let currentSelectedDateFormatted = null;

    function renderCalendar() {
        const year = currentDate.getFullYear();
        const month = currentDate.getMonth();

        document.getElementById('currentMonth').textContent =
            currentDate.toLocaleDateString('en-US', { month: 'long', year: 'numeric' });
        document.getElementById('monthPicker').value = month + 1;
        document.getElementById('yearPicker').value = year;

        const firstDay       = new Date(year, month, 1).getDay();
        const daysInMonth    = new Date(year, month + 1, 0).getDate();
        const daysInPrevMonth = new Date(year, month, 0).getDate();

        const calendarDays = document.getElementById('calendarDays');
        calendarDays.innerHTML = '';

        const today = new Date();
        const isCurrentMonth = today.getFullYear() === year && today.getMonth() === month;

        // Previous month filler days
        for (let i = firstDay - 1; i >= 0; i--) {
            calendarDays.appendChild(createDayElement(daysInPrevMonth - i, 'other-month', null));
        }

        // Current month days
        for (let day = 1; day <= daysInMonth; day++) {
            const date = new Date(year, month, day);
            const dayOfWeek = date.getDay();
            let classes = [];
            if (dayOfWeek === 0 || dayOfWeek === 6) classes.push('weekend');
            if (isCurrentMonth && day === today.getDate()) classes.push('today');
            calendarDays.appendChild(createDayElement(day, classes.join(' '), date));
        }

        // Next month filler days
        const remainingCells = 42 - (firstDay + daysInMonth);
        for (let day = 1; day <= remainingCells; day++) {
            calendarDays.appendChild(createDayElement(day, 'other-month', null));
        }
    }

    function createDayElement(day, className, date) {
        const div = document.createElement('div');
        div.className = `calendar-day ${className}`.trim();

        if (date) {
            const year  = date.getFullYear();
            const month = String(date.getMonth() + 1).padStart(2, '0');
            const d     = String(date.getDate()).padStart(2, '0');

            const a = document.createElement('a');
            a.href = `/segrefruit/dashboard?date=${year}-${month}-${d}`;
            a.textContent = day;
            div.appendChild(a);
            div.addEventListener('click', () => selectDate(div, date));
        }else{
            div.textContent = day;
        }

        return div;
    }

    function selectDate(el, date) {
        // Clear previous selection
        document.querySelectorAll('.calendar-day').forEach(d => d.classList.remove('selected'));
        el.classList.add('selected');

        selectedDate = date;
        const year  = date.getFullYear();
        const month = String(date.getMonth() + 1).padStart(2, '0');
        const day   = String(date.getDate()).padStart(2, '0');
        currentSelectedDateFormatted = `${year}-${month}-${day}`;

        // Update the inline selected-date label
        const label = date.toLocaleDateString('en-US', {
            weekday: 'long', year: 'numeric', month: 'long', day: 'numeric'
        });
        const display = document.getElementById('selectedDateDisplay');

        
        display.innerHTML = '<span class="date-label">' + label + '</span>';
        display.style.display = 'flex';
    }

    document.getElementById('prevMonth').addEventListener('click', () => {
        currentDate.setMonth(currentDate.getMonth() - 1);
        renderCalendar();
    });

    document.getElementById('nextMonth').addEventListener('click', () => {
        currentDate.setMonth(currentDate.getMonth() + 1);
        renderCalendar();
    });

    document.getElementById('monthPicker').addEventListener('change', function () {
        currentDate.setMonth(parseInt(this.value) - 1);
        renderCalendar();
    });

    document.getElementById('yearPicker').addEventListener('change', function () {
        currentDate.setFullYear(parseInt(this.value));
        renderCalendar();
    });

    renderCalendar();

    </script>

    <div class="table-wrap">
        <div class="table-header">
            <span class="table-title">🕒 Activity Logs</span>
            <div style="display:flex; align-items:center; gap:.75rem;">
                <form method="GET" action="{{ url()->current() }}" style="display:flex; align-items:center; gap:.5rem;">
                    
                <label style="font-size:.68rem; text-transform:uppercase; letter-spacing:.08em; color:var(--muted);">🔍︎ Date: </label>
                    <input type="date" name="search_date"
                           value="{{ $searchDate ?? '' }}"
                           onchange="this.form.submit()"
                           style="font-family:var(--font-mono); font-size:.75rem; background:var(--bg);
                                  border:1.5px solid var(--border-dark); border-radius:var(--radius);
                                  color:var(--text); padding:.3rem .6rem; cursor:pointer;">

                    @if($searchDate)
                        <a href="{{ url()->current() }}?per_page={{ $perPage }}"
                           style="font-family:var(--font-mono); font-size:.72rem; color:var(--accent);
                                  text-decoration:none; letter-spacing:.04em; white-space:nowrap;"
                           title="Clear date filter">✕ Clear</a>
                    @endif

                
                    <label style="font-size:.68rem; text-transform:uppercase; letter-spacing:.08em; color:var(--muted);">Show</label>
                    <select name="per_page" onchange="this.form.submit()"
                        style="font-family:var(--font-mono); font-size:.75rem; background:var(--bg);
                               border:1.5px solid var(--border-dark); border-radius:var(--radius);
                               color:var(--text); padding:.3rem .6rem; cursor:pointer;">
                        @foreach([10, 25, 50] as $option)
                            <option value="{{ $option }}" {{ $perPage == $option ? 'selected' : '' }}>
                                {{ $option }}
                            </option>
                        @endforeach
                    </select>
                    <span style="font-size:.68rem; text-transform:uppercase; letter-spacing:.08em; color:var(--muted);">per page</span>
                </form>
            </div>
        </div>
        <table class="sf-table">
            <thead>
                <tr>
                    <th>Activity</th>
                    <th>Date &amp; Time</th>
                </tr>
            </thead>
            <tbody>
                @foreach($actlogs as $log)
                <tr>
                    <td><span class="dot"></span>{{ $log->info }}</td>
                    <td class="timestamp-cell" data-timestamp="{{ \Carbon\Carbon::parse($log->log_date)->timestamp }}">
                        {{ \Carbon\Carbon::parse($log->log_date)->format('Y-m-d g:i:s A') }}
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>

        {{-- Pagination controls --}}
        @if($actlogs->lastPage() > 1)
        <div style="display:flex; align-items:center; justify-content:space-between;
                    padding:.75rem 1.4rem; border-top:1.5px solid var(--border);
                    font-size:.75rem; color:var(--muted);">
            <span>
                Showing {{ $actlogs->firstItem() }}–{{ $actlogs->lastItem() }} of {{ $actlogs->total() }} entries
            </span>
            <div style="display:flex; gap:.4rem;">
                @if($actlogs->onFirstPage())
                    <span class="btn-sf" style="opacity:.4; cursor:default;">← Prev</span>
                @else
                    <a href="{{ $actlogs->previousPageUrl() }}" class="btn-sf">← Prev</a>
                @endif
                @if($actlogs->hasMorePages())
                    <a href="{{ $actlogs->nextPageUrl() }}" class="btn-sf">Next →</a>
                @else
                    <span class="btn-sf" style="opacity:.4; cursor:default;">Next →</span>
                @endif
            </div>
        </div>
        @endif
    </div>

    <!-- Logout Modal -->
    <div class="modal fade" id="logoutModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-sm">
            <div class="modal-content">
                <div class="modal-body text-center py-4">
                    <p style="font-size:.95rem; margin:0; color:var(--text); font-family:var(--font-head); font-weight:700;">Confirm logout?</p>
                    <p style="font-size:.75rem; color:var(--muted); margin-top:.35rem;">You'll be returned to the login screen.</p>
                </div>
                <div class="modal-footer border-top-0 pt-0 pb-3 px-3">
                    <div class="d-flex gap-2 w-100">
                        <button type="button" class="btn-sf flex-fill justify-content-center" data-bs-dismiss="modal">Cancel</button>
                        <form action="/logout" method="POST" class="flex-fill">
                            @csrf
                            <button type="submit" class="btn-sf accent w-100 justify-content-center">➜] Logout</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Import Modal -->
    <div class="modal fade" id="importModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Import Fruits From CSV</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form action="{{ route('fruits.import') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <p style="font-size:.72rem; color:var(--muted); margin-bottom:.8rem; letter-spacing:.04em; text-transform:uppercase;">
                            Select a <span style="color:var(--accent); font-weight:500;">.CSV</span> file to import
                        </p>
                        <p style="font-size:.69rem; color:var(--muted); margin-bottom:.8rem; letter-spacing:.04em; text-transform:uppercase;">
                            Import record example:<br>
                            (Fruit, Status, Date and Time)<br>
                            - tomato, accepted, 01/01/2020 10:00:00 AM
                        </p>
                        <input type="file" name="csv_file" accept=".csv" class="form-control mb-3" required>
                        <button type="submit" class="btn-sf accent w-100 justify-content-center" style="padding:.6rem;">
                            ↑ Upload File
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Restore Modal -->
    <div class="modal fade" id="restoreModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Restore SQL Database</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form action="{{ route('backups.restore') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <p style="font-size:.72rem; color:var(--muted); margin-bottom:.8rem; letter-spacing:.04em; text-transform:uppercase;">
                            Select a backup <span style="color:var(--accent); font-weight:500;">.SQL</span> file to restore/import data
                        </p>
                        <input type="file" name="backup_file" accept=".sql" class="form-control mb-3" required>
                        <button type="submit" class="btn-sf accent w-100 justify-content-center" style="padding:.6rem;">
                            ↑ Upload File
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

@endsection