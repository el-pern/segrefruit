<?php

namespace App\Http\Controllers;

use App\Exports\FruitsExport;
use App\Http\Controllers\LogController;
use App\Imports\FruitsImport;
use App\Models\Batch;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Facades\Excel;

class FruitController extends Controller
{
    public function export(Request $request)
    {
        session(['pending_export' => true]);
        return redirect()->route('fruits.download');
    }

    public function downloadExport(Request $request){
        if (!session('pending_export')) {
            return redirect('/segrefruit')->withErrors(['export' => 'No export initiated.']);
        }

        session()->forget('pending_export');

        // Log ONLY here
        $logger = new LogController();
        $logger->logActivity($request, auth()->user()->email . " attempted to export fruits CSV");

        return Excel::download(new FruitsExport, 'fruits.csv', \Maatwebsite\Excel\Excel::CSV);
    }

    public function import(Request $request)
    {
        // Use Validator facade instead of $request->validate()
        $validator = \Validator::make($request->all(), [
            'csv_file' => 'required|file|mimes:csv,txt',
        ]);
    
        if ($validator->fails()) {
            $error = $request->hasFile('csv_file')
                ? 'Invalid file type. Please upload a valid CSV file.'
                : 'No file uploaded. Please choose a CSV file before uploading.';
    
            return back()->with('error', $error);
        }

        try{
            Excel::import(new FruitsImport, $request->file('csv_file'));

            $logger = new LogController();
        $logger->logActivity($request, auth()->user()->email . " imported fruits CSV");

            return back()->with('success', 'Import successful!');
        } catch (\Maatwebsite\Excel\Validators\ValidationException $e) {
            return back()->with('error', 'Import failed: ' . $e->getMessage());
        } catch (\Illuminate\Validation\ValidationException $e) {
            return back()->with('error', 'Import failed: ' . $e->getMessage());
        } catch (\Exception $e) {
            // Catches missing columns, malformed CSV, etc.
            $msg = $e->getMessage();

            if (str_contains($msg, 'Undefined array key') || str_contains($msg, 'Missing')) {
                return back()->with('error', 'CSV format error: Required columns (fruit, status, date_and_time) are missing or misspelled.');
            }

            return back()->with('error', 'Import failed: ' . $msg);
        }

    }

    public function dashboard(Request $request){

        $categories = ['tomato', 'mango', 'banana', 'apple', 'orange'];

        $date   = $request->query('date',   now()->toDateString()); // e.g. 2026-05-06
        $period = $request->query('period', 'daily');               // daily | weekly | monthly
        $batchId = $request->query('batch',  null);

        $carbon = \Carbon\Carbon::parse($date);

        // Fetch batches for the selected date
        $batchesForDate = $period === 'daily'
        ? Batch::whereDate('start_time', $carbon->toDateString())
                           ->orderBy('start_time')
                           ->get()
        : collect();

        // Resolve the selected batch (only valid on daily)
        $selectedBatch = null;
        if ($period === 'daily' && $batchId) {
            $selectedBatch = $batchesForDate->firstWhere('batch_num', $batchId);
        }
    
        $applyFilter = function ($query) use ($period, $carbon, $selectedBatch) {

            // Batch filter takes priority over period filter on daily
            if ($selectedBatch) {
                return $query->whereBetween('created_at', [
                    $selectedBatch->start_time,
                    $selectedBatch->end_time,
                ]);
            }

            return match ($period) {
                'weekly'  => $query->whereBetween('created_at', [
                                $carbon->copy()->startOfWeek(\Carbon\Carbon::SUNDAY),
                                $carbon->copy()->endOfWeek(\Carbon\Carbon::SATURDAY),
                             ]),
                'monthly' => $query->whereYear('created_at',  $carbon->year)
                                   ->whereMonth('created_at', $carbon->month),
                default   => $query->whereDate('created_at', $carbon->toDateString()), // daily
            };
        };

        $logger = new LogController();
        $message = auth()->user()->email." directed to dashboard for ".$carbon->format('d F Y');
        $logger->logActivity($request, $message);

        $fruitCounts = collect($categories)->map(fn($cat) =>
            $applyFilter(DB::table('fruits')->where('fruit_name', 'ILIKE', "%{$cat}%"))->count()
        );

        $dmgCounts = collect($categories)->map(fn($cat) =>
            $applyFilter(DB::table('dmg_fruits')->where('fruit_name', 'ILIKE', "%{$cat}%"))->count()
        );

        $totalFruits = $applyFilter(DB::table('fruits'))->count();
        $totalDmg    = $applyFilter(DB::table('dmg_fruits'))->count();

        $periodLabel = match ($period) {
            'weekly'  => 'Week of ' . $carbon->copy()->startOfWeek(\Carbon\Carbon::SUNDAY)->format('M d') .
                         ' – '      . $carbon->copy()->endOfWeek(\Carbon\Carbon::SATURDAY)->format('M d, Y'),
            'monthly' => $carbon->format('F Y'),
            default   => $carbon->format('F d, Y'),
        };

        // Override period label when a batch is active
        if ($selectedBatch) {
            $start = \Carbon\Carbon::parse($selectedBatch->start_time)->format('g:i A');
            $end   = \Carbon\Carbon::parse($selectedBatch->end_time)->format('g:i A');
            $periodLabel = "{$carbon->format('F d, Y')} · Batch #{$selectedBatch->batch_num} · {$start} – {$end}";
        }

        return view('report', compact(
            'categories','fruitCounts',
            'dmgCounts','totalFruits',
            'totalDmg','date',
            'period','periodLabel',
            'batchesForDate', 'selectedBatch',
            'batchId'  
        ));
    }

    public function createBatch(Request $request){

        $setbatch = $request->validate([
            'start_time' => 'required',
            'end_time' => 'required'
        ]);
        
        if ($request->end_time <= $request->start_time) {
            return back()
            ->with('error', 'End time must be after start time.')
            ->withInput();
        }

        $chars = "0123456789";
        $notif_randnum = "";
        for($i = 0; $i < 6; $i++){
            $notif_randnum .= $chars[random_int(0, strlen($chars) - 1)];
        }
        //generated notif id
        $repnotif_id = $notif_randnum;

        // Combine selected date with the time inputs
        $date = $request->input('date', now()->toDateString());

        $carbon = \Carbon\Carbon::parse($date);

        $startDatetime = $date . ' ' . $setbatch['start_time'];
        $endDatetime   = $date . ' ' . $setbatch['end_time'];

        Batch::create([
            'batch_num' => $repnotif_id,
            'start_time' => $startDatetime,
            'end_time' => $endDatetime
        ]);

        $logger = new LogController();
        $message = auth()->user()->email." created a batch for ".$carbon->format('d F Y');
        $logger->logActivity($request, $message);

        return redirect('/segrefruit/dashboard?date='.$date)->with('success', 'Batch has been successfully added');

    }
}
