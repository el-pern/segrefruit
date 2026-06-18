@extends('Layouts.app')
@section('content')

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard — SegreFruit</title>

    <link rel="icon" type="image/x-icon" href="{{ asset('SEGRE_ICON.png') }}">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
        crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=DM+Mono:wght@400;500&family=Syne:wght@600;700;800&display=swap" rel="stylesheet">

    <style>
        :root {
            --bg:         #f5f0e8;
            --surface:    #fdfaf4;
            --surface2:   #f8f3e9;
            --border:     #e2d9c8;
            --border-dark:#c9bda8;
            --text:       #2c1a0e;
            --muted:      #8a6e56;
            --accent:     #d94f2b;      /* tomato red */
            --accent-dim: rgba(217,79,43,.1);
            --accent2:    #b83220;      /* darker tomato for "damaged" */
            --green:      #6aaa3a;      /* leaf green */
            --green2:      #3d6221; 
            --green-dim:  rgba(106,170,58,.12);
            --yellow:     #d4972a;      /* warm amber for warnings */
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

        /* Top bar */
        .topbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 2.5rem;
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
        .brand-icon { display: inline-flex; align-items: center; justify-content: center; width: 34px; height: 34px; background: var(--accent); border-radius: 50%; font-size: 1.1rem; }
        .brand .sep { color: var(--muted); font-weight: 600; font-size: 1rem; margin-left: .25rem; }
        .brand span.hi { color: var(--accent); }

        .btn-sf {
            font-family: var(--font-mono);
            font-size: .75rem;
            letter-spacing: .04em;
            text-transform: uppercase;
            border: 1.5px solid var(--border-dark);
            background: var(--surface);
            color: var(--muted);
            border-radius: var(--radius);
            padding: .4rem .9rem;
            cursor: pointer;
            transition: all .14s;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: .3rem;
            box-shadow: var(--shadow);
        }
        .btn-sf:hover { color: var(--text); border-color: var(--accent); background: #fff; transform: translateY(-1px); }

        .btn-sf.accent { background: var(--accent); border-color: var(--accent); color: #fff; }
        .btn-sf.accent:hover { background: #c4411f; border-color: #c4411f; color: #fff; }

        .btn-sf.ghost-green { background: var(--green-dim); border-color: var(--green); color: #3d7a1a; }
        .btn-sf.ghost-green:hover { background: rgba(106,170,58,.22); color: #2d5c12; border-color: #5a9830; }


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


        /* Stat grid */
        .stat-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1rem;
            margin-bottom: 1.5rem;
        }
        .stat-card {
            background: var(--surface);
            border: 1.5px solid var(--border);
            border-radius: var(--radius);
            padding: 1.2rem 1.4rem;
            position: relative;
            overflow: hidden;
            transition: border-color .15s, transform .15s, box-shadow .15s;
            box-shadow: var(--shadow);
            animation: fadeUp .3s ease both;
        }
        .stat-card:hover { border-color: var(--accent); transform: translateY(-2px); box-shadow: 0 6px 20px rgba(44,26,14,.12); }
        .stat-card::before {
            content: '';
            position: absolute;
            top: 0; left: 0;
            width: 3px; height: 100%;
            background: var(--card-accent);
        }
        .stat-card .label { font-size: .66rem; letter-spacing: .1em; text-transform: uppercase; color: var(--muted); margin-bottom: .5rem; }
        .stat-card .value { font-family: var(--font-head); font-size: 2.1rem; font-weight: 800; line-height: 1; color: var(--text); letter-spacing: -0.03em; }
        .stat-card .sub { font-size: .7rem; color: var(--muted); margin-top: .4rem; }

        /* Panels */
        .panel-grid {
            display: grid;
            grid-template-columns: 3fr 2fr;
            gap: 1rem;
            margin-bottom: 1rem;
        }
        @media (max-width: 768px) { .panel-grid { grid-template-columns: 1fr; } }

        .panel {
            background: var(--surface);
            border: 1.5px solid var(--border);
            border-radius: var(--radius);
            padding: 1.4rem;
            box-shadow: var(--shadow);
            animation: fadeUp .35s ease both;
        }

        .panel-title {
            font-family: var(--font-head);
            font-size: .88rem;
            font-weight: 700;
            color: var(--text);
            margin-bottom: 1.2rem;
            display: flex;
            align-items: center;
            gap: .5rem;
        }
        .panel-title::before {
            content: '';
            width: 8px; height: 8px;
            border-radius: 50%;
            background: var(--panel-dot);
            flex-shrink: 0;
        }

        /* Table */
        .data-table { width: 100%; border-collapse: collapse; font-size: .8rem; }
        .data-table thead th {
            padding: .6rem .9rem;
            text-align: left;
            font-size: .65rem;
            letter-spacing: .09em;
            text-transform: uppercase;
            color: var(--muted);
            background: rgba(217,79,43,.04);
            border-bottom: 1.5px solid var(--border);
            font-weight: 500;
        }
        .data-table tbody tr { border-bottom: 1px solid var(--border); transition: background .12s; }
        .data-table tbody tr:last-child { border-bottom: none; }
        .data-table tbody tr:hover { background: rgba(217,79,43,.04); }
        .data-table tbody td { padding: .7rem .9rem; color: var(--text); }

        /* Progress */
        .prog-wrap { display: flex; align-items: center; gap: .5rem; }
        .prog-bar-bg { flex: 1; height: 4px; background: var(--border); border-radius: 4px; overflow: hidden; }
        .prog-bar-fill { height: 100%; border-radius: 4px; transition: width .4s ease; }

        /* Badges */
        .badge-good, .badge-bad, .badge-zero{
            font-family: var(--font-mono);
            font-size: .64rem;
            letter-spacing: .06em;
            text-transform: uppercase;
            padding: .2rem .55rem;
            border-radius: 6px;
            font-weight: 500;
        }
        .badge-good { background: var(--green-dim); color: #3d7a1a; border: 1px solid rgba(106,170,58,.3); }
        .badge-bad  { background: var(--accent-dim); color: var(--accent); border: 1px solid rgba(217,79,43,.25); }
        .badge-zero  { background: var(--accent-dim); color: var(--muted); border: 1px solid rgba(139, 116, 110, 0.25); }

        @keyframes fadeUp {
            from { opacity: 0; transform: translateY(10px); }
            to   { opacity: 1; transform: translateY(0); }
        }
        .stat-card:nth-child(1) { animation-delay: .04s; }
        .stat-card:nth-child(2) { animation-delay: .08s; }
        .stat-card:nth-child(3) { animation-delay: .12s; }
        .stat-card:nth-child(4) { animation-delay: .16s; }

        /* Period selector bar */
        .period-bar {
            display: flex;
            align-items: center;
            gap: .75rem;
            flex-wrap: wrap;
            margin-bottom: 1.5rem;
            padding: .75rem 1rem;
            background: var(--surface);
            border: 1.5px solid var(--border);
            border-radius: var(--radius);
            box-shadow: var(--shadow);
        }
        .date-input {
            font-family: var(--font-mono);
            font-size: .8rem;
            padding: .35rem .7rem;
            border: 1.5px solid var(--border-dark);
            border-radius: var(--radius);
            background: var(--bg);
            color: var(--text);
            cursor: pointer;
        }
        .date-input:focus { outline: none; border-color: var(--accent); }

        .period-tabs { display: flex; gap: .35rem; }
        .period-tab {
            font-family: var(--font-mono);
            font-size: .72rem;
            letter-spacing: .05em;
            text-transform: uppercase;
            padding: .35rem .75rem;
            border: 1.5px solid var(--border-dark);
            border-radius: var(--radius);
            color: var(--muted);
            text-decoration: none;
            background: var(--bg);
            transition: all .14s;
        }
        .period-tab:hover  { color: var(--text); border-color: var(--accent); background: #fff; }
        .period-tab.active { background: var(--accent); color: #fff; border-color: var(--accent); font-weight: 600; }

        .period-label-badge {
            margin-left: auto;
            font-size: .72rem;
            color: var(--muted);
            background: var(--accent-dim);
            border: 1px solid var(--border);
            border-radius: 99px;
            padding: .25rem .75rem;
            letter-spacing: .03em;
        }

        @page {
            margin: 1.5cm 1.5cm 1.5cm 1.5cm; /* top right bottom left — adjust as needed */
        }

        @media print{

            * {
                -webkit-print-color-adjust: exact !important;
                print-color-adjust: exact !important;
            }

            body {
                padding: 0 !important;
                background: #fff !important;
            }

            .date-input, .sep, .btn-sf{
                display: none;
            }

            .period-tab.active {
                background: var(--accent) !important;
                color: #fff !important;
                border-color: var(--accent) !important;
                font-weight: 600;
            }

            .logo-badge{
                background: #e8401a !important;
            }

            /* Stack panels vertically so donut panel gets full width */
            .panel-grid {
                grid-template-columns: 1fr !important;
            }

            .panel-grid .panel {
                break-inside: avoid;
                page-break-inside: avoid;
            }

            .bar-panel, .stat-grid, .categ-panel{
                margin-top: 5%;
            }


            /* Center the donut chart canvas within its panel */
            #donutChart {
                display: block;
                margin: 0 auto;
                max-width: 300px;
                max-height: 300px;
            }

            .logo-image{
                width:170px;
                height:170px;
            }

            .topbar {
                justify-content: center !important;
            }
            
            .brand {
                justify-content: center !important;
                width: 100% !important;
            }

            #batchSelect{
                display: none !important;
            }
        }
        
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
            <img class="logo-image" src="{{ asset('SEGRE_ICON.png') }}"><span class="sep">/ Dashboard</span>
        </div>
        <a href="/segrefruit" class="btn-sf">← Home</a>
        <button class="btn-sf ghost-green" data-bs-toggle="modal" data-bs-target="#batchModal" title="Create a new batch for day selected">+ Create Batch</button>
        <button class="btn-sf" onclick="window.print();" title="Print or save as PDF">🖨️ Print</button>
    </div>

    <div class="period-bar">
        <input type="date"
               id="datePicker"
               class="date-input"
               value="{{ $date }}"
               max="{{ now()->toDateString() }}">

        <div class="period-tabs">
            @foreach(['daily' => 'Daily', 'weekly' => 'Weekly', 'monthly' => 'Monthly'] as $key => $label)
                <a href="?date={{ $date }}&period={{ $key }}"
                   class="period-tab {{ $period === $key ? 'active' : '' }}">
                    {{ $label }}
                </a>
            @endforeach
        </div>

        @if($period === 'daily')
            <select id="batchSelect"
                    style="font-family:var(--font-mono); font-size:.72rem; padding:.28rem .65rem;
                           border:1.5px solid var(--border-dark); border-radius:var(--radius);
                           background:var(--bg); color:var(--muted); cursor:pointer;">
                <option value="">All (No Batch)</option>
                @foreach($batchesForDate as $batch)
                    @php
                        $bStart = \Carbon\Carbon::parse($batch->start_time)->format('g:i A');
                        $bEnd   = \Carbon\Carbon::parse($batch->end_time)->format('g:i A');
                    @endphp
                    <option value="{{ $batch->batch_num }}"
                        {{ $batchId == $batch->batch_num ? 'selected' : '' }}>
                        #{{ $batch->batch_num }} · {{ $bStart }} – {{ $bEnd }}
                    </option>
                @endforeach
            </select>
        @endif

        @if($selectedBatch)
            <span class="period-label-badge batch-active-badge">
                {{ \Carbon\Carbon::parse($date)->format('F d, Y') }}
                <span class="badge-sep">·</span>
                Batch No. {{ $selectedBatch->batch_num }}
                <span class="badge-sep">·</span>
                {{ \Carbon\Carbon::parse($selectedBatch->start_time)->format('g:i A') }} – {{ \Carbon\Carbon::parse($selectedBatch->end_time)->format('g:i A') }}
            </span>
        @else
    <span class="period-label-badge">{{ $periodLabel }}</span>
@endif
    </div>

    <script>
        document.getElementById('datePicker').addEventListener('change', function () {
            const period = new URLSearchParams(window.location.search).get('period') ?? 'daily';
            window.location.href = '?date=' + this.value + '&period=' + period;
        });

        const batchSelect = document.getElementById('batchSelect');
        if (batchSelect) {
            batchSelect.addEventListener('change', function () {
                const params = new URLSearchParams(window.location.search);
                if (this.value) {
                    params.set('batch', this.value);
                } else {
                    params.delete('batch');
                }
                window.location.href = '?' + params.toString();
            });
        }
    </script>

    @php
        $grand = $totalFruits + $totalDmg;
        $rate  = $grand > 0 ? round(($totalFruits / $grand) * 100, 1) : 0;
    @endphp

    <div class="stat-grid">
        <div class="stat-card" style="--card-accent: var(--green2);">
            <div class="label">Total Accepted Fruits</div>
            <div class="value">{{ number_format($totalFruits) }}</div>
            <div class="sub">{{$periodLabel}}</div>
        </div>
        <div class="stat-card" style="--card-accent: var(--accent2);">
            <div class="label">Total Rejected Fruits</div>
            <div class="value">{{ number_format($totalDmg) }}</div>
            <div class="sub">{{$periodLabel}}</div>
        </div>
        <div class="stat-card" style="--card-accent: var(--green);">
            <div class="label">Total Fruit Acceptance Rate</div>
            <div class="value">{{ $rate }}%</div>
            <div class="sub">Accepted vs. total recorded</div>
        </div>
    </div>

    <div class="panel-grid">
        <div class="panel bar-panel">
            <div class="panel-title" style="--panel-dot: var(--accent);">Accepted vs. Rejected by Category</div>
            <canvas id="barChart" height="120"></canvas>
        </div>
        <div class="panel">
            <div class="panel-title" style="--panel-dot: var(--green);">Overall Split</div>
            <canvas id="donutChart" height="120"></canvas>
        </div>
    </div>

    <div class="panel categ-panel" style="margin-bottom:2rem; padding:0; overflow:hidden;">
        <div style="padding:1rem 1.4rem; border-bottom:1.5px solid var(--border); background: linear-gradient(to right, rgba(217,79,43,.05), transparent);">
            <div class="panel-title" style="--panel-dot: var(--yellow); margin-bottom:0;">Category Breakdown</div>
        </div>
        @php $grandTotal = array_sum($fruitCounts->toArray()) + array_sum($dmgCounts->toArray()); @endphp
        <table class="data-table">
            <thead>
                <tr>
                    <th>Category</th>
                    <th>Accepted</th>
                    <th>Rejected</th>
                    <th>Total</th>
                    <th>Acceptance Rate</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                @foreach($categories as $i => $cat)
                    @php
                        $good = $fruitCounts[$i] ?? 0;
                        $dmg  = $dmgCounts[$i]   ?? 0;
                        $tot  = $good + $dmg;
                        $pct  = $tot > 0 ? round(($good / $tot) * 100) : 0;
                    @endphp
                    <tr>
                        <td style="font-weight:700; text-transform:capitalize; font-family:var(--font-head); font-size:.85rem;">{{ $cat }}</td>
                        <td style="color:#3d7a1a; font-weight:500;">{{ $good }}</td>
                        <td style="color:var(--accent); font-weight:500;">{{ $dmg }}</td>
                        <td style="color:var(--muted);">{{ $tot }}</td>
                        <td style="min-width:140px;">
                            <div class="prog-wrap">
                                <div class="prog-bar-bg">
                                    <div class="prog-bar-fill"
                                        style="width:{{ $pct }}%;
                                               background:{{ $pct >= 70 ? 'var(--green)' : ($pct >= 40 ? 'var(--yellow)' : 'var(--accent)') }}">
                                    </div>
                                </div>
                                <span style="font-size:.72rem; min-width:30px; text-align:right; color:var(--muted);">{{ $pct }}%</span>
                            </div>
                        </td>
                        <td>
                            @if($pct >= 70)
                                <span class="badge-good">Good</span>
                            @elseif($pct == 0)
                                <span class="badge-zero">N/A</span>
                            @else
                                <span class="badge-bad">At Risk</span>
                            @endif
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>

    <script>
    document.addEventListener('DOMContentLoaded', function () {
        Chart.defaults.color = '#8a6e56';
        Chart.defaults.font.family = "'DM Mono', monospace";
        Chart.defaults.font.size = 11;

        const labels     = @json(array_map('ucfirst', $categories));
        const goodCounts = @json($fruitCounts->values());
        const dmgCounts  = @json($dmgCounts->values());

        new Chart(document.getElementById('barChart'), {
            type: 'bar',
            data: {
                labels,
                datasets: [
                    {
                        label: 'Accepted',
                        data: goodCounts,
                        backgroundColor: 'rgba(106,170,58,0.7)',
                        borderColor: 'rgba(106,170,58,1)',
                        borderWidth: 1,
                        borderRadius: 4,
                    },
                    {
                        label: 'Rejected',
                        data: dmgCounts,
                        backgroundColor: 'rgba(217,79,43,0.7)',
                        borderColor: 'rgba(217,79,43,1)',
                        borderWidth: 1,
                        borderRadius: 4,
                    },
                ]
            },
            options: {
                responsive: true,
                maintainAspectRatio: true,
                animation: { duration: 500, easing: 'easeOutQuart' },
                plugins: {
                    legend: { position: 'top', labels: { boxWidth: 10, padding: 14 } },
                    tooltip: { mode: 'index', intersect: false }
                },
                scales: {
                    x: { grid: { color: 'rgba(44,26,14,.06)' } },
                    y: { beginAtZero: true, ticks: { stepSize: 1 }, grid: { color: 'rgba(44,26,14,.06)' } }
                }
            }
        });

        const totalGood = goodCounts.reduce((a, b) => a + b, 0);
        const totalDmg  = dmgCounts.reduce((a, b) => a + b, 0);

        new Chart(document.getElementById('donutChart'), {
            type: 'doughnut',
            data: {
                labels: ['Accepted', 'Rejected'],
                datasets: [{
                    data: [totalGood, totalDmg],
                    backgroundColor: ['rgba(106,170,58,0.8)', 'rgba(217,79,43,0.75)'],
                    borderColor: ['#6aaa3a', '#d94f2b'],
                    borderWidth: 2,
                    hoverOffset: 6,
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: true,
                cutout: '70%',
                animation: { duration: 500, easing: 'easeOutQuart' },
                plugins: {
                    legend: { position: 'bottom', labels: { boxWidth: 10, padding: 14 } },
                    tooltip: {
                        callbacks: {
                            label: ctx => {
                                const total = totalGood + totalDmg;
                                const pct = total > 0 ? Math.round((ctx.parsed / total) * 100) : 0;
                                return ` ${ctx.label}: ${ctx.parsed} (${pct}%)`;
                            }
                        }
                    }
                }
            }
        });
    });
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Batch Modal -->
    <div class="modal fade" id="batchModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Create New Batch</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form action="{{ route('fruits.batch') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <input type="hidden" name="date" value="{{ $date }}">
                        <label>Start Time</label>
                        <input type="time" name="start_time" class="form-control mb-3" required>

                        <label>End Time</label>
                        <input type="time" name="end_time" class="form-control mb-3" required>

                        <button type="submit" class="btn-sf accent w-100 justify-content-center" style="padding:.6rem;">
                            + Create
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
@endsection