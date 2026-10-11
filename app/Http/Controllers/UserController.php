<?php

namespace App\Http\Controllers;

use App\Http\Controllers\LogController;
use App\Models\Log;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class UserController extends Controller
{
    public function login(Request $request){

        $usercreds = $request->validate([
            'email' => ['required'],
            'password' => ['required']
        ]);

        if(auth()->attempt($usercreds)){

            $logger = new LogController();
            $message = auth()->user()->email." logged in";

            $logger->logActivity($request, $message);

            $request->session()->regenerate();

            return redirect('/segrefruit')->with('success','You are now logged in.');
        }

        $user = User::where('email', $request->input('email'))->first();

        if(!$user){
            return back()->withErrors([
            'email' => 'Invalid username'
         ])->onlyInput('email');
        }else{

        return back()->withErrors([
        'password' => 'Invalid password'
         ])->onlyInput('email');}

    }

    public function logout(Request $request){

        $logger = new LogController();
        $message = auth()->user()->email." logged out";
        $logger->logActivity($request, $message);

        auth()->logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        return redirect('/segrefruit/login');
    }

    public function home(Request $request){

        $perPage = in_array((int)$request->input('per_page'), [10, 25, 50])
        ? (int)$request->input('per_page')
        : 10;

        $searchDate = $request->input('search_date');

        $actlogs = Log::orderBy('log_date', 'desc')
        ->when($searchDate, fn($q) => $q->whereDate('log_date', $searchDate))
        ->paginate($perPage)
        ->appends(['per_page' => $perPage]);

        return view('home', compact('actlogs', 'perPage', 'searchDate'));
    }

    public function backup(Request $request){
        $db     = config('database.connections.pgsql.database');
        $user   = config('database.connections.pgsql.username');
        $host   = config('database.connections.pgsql.host');
        $port   = config('database.connections.pgsql.port');
        $pass   = config('database.connections.pgsql.password');

        $filename  = 'segrefruit_' . now()->format('Y-m-d_H-i-s') . '.sql';
        $directory = storage_path('app/backups');

        if (!is_dir($directory)) {
            mkdir($directory, 0755, true);
        }

        $filepath = $directory . '/' . $filename;

        $command = sprintf(
            'PGPASSWORD=%s pg_dump -h %s -p %s -U %s -F p --inserts --on-conflict-do-nothing -f %s %s 2>&1',
            escapeshellarg($pass),
            escapeshellarg($host),
            escapeshellarg($port),
            escapeshellarg($user),
            escapeshellarg($filepath),
            escapeshellarg($db)
        );

        exec($command, $output, $exitCode);

        if ($exitCode !== 0) {
            return back()->withErrors(['backup' => 'Backup failed: ' . implode("\n", $output)]);
        }

        // Store the pending filename in session instead of logging immediately
        session(['pending_backup' => $filename]);
    
        return redirect()->route('backups.download');
    }

    public function downloadBackup(Request $request){
        $filename = session('pending_backup');

        if (!$filename) {
            return redirect('/segrefruit')->withErrors(['backup' => 'No backup file found.']);
        }

        $filepath = storage_path('app/backups/' . $filename);

        if (!file_exists($filepath)) {
            return redirect('/segrefruit')->withErrors(['backup' => 'Backup file missing.']);
        }

        // Clear session
        session()->forget('pending_backup');
    
        $logger = new LogController();
        $logger->logActivity($request, auth()->user()->email . " attempted to create a backup: {$filename}");

        return response()->download($filepath, $filename, [
            'Content-Type' => 'application/sql',
        ])->deleteFileAfterSend(false);
    }

    public function restore(Request $request){
        // Use Validator facade instead of $request->validate()
        $validator = \Validator::make($request->all(), [
            'backup_file' => 'required|file|mimes:sql,txt',
        ]);

        if ($validator->fails()) {
            $error = $request->hasFile('backup_file')
                ? 'Invalid file type. Please upload a valid SQL file.'
                : 'No file uploaded. Please choose an SQL file before uploading.';
    
            return back()->with('error', $error);
        }

        $db   = config('database.connections.pgsql.database');
        $user = config('database.connections.pgsql.username');
        $host = config('database.connections.pgsql.host');
        $port = config('database.connections.pgsql.port');
        $pass = config('database.connections.pgsql.password');

        $uploadedFile = $request->file('backup_file');
        $filepath     = $uploadedFile->storeAs('backups/restore_temp', $uploadedFile->getClientOriginalName());
        $fullPath     = storage_path('app/' . $filepath);

        $command = sprintf(
            'PGPASSWORD=%s psql -h %s -p %s -U %s -v ON_ERROR_STOP=0 --single-transaction -d %s -f %s 2>&1',
            escapeshellarg($pass),
            escapeshellarg($host),
            escapeshellarg($port),
            escapeshellarg($user),
            escapeshellarg($db),
            escapeshellarg($fullPath)
        );

        exec($command, $output, $exitCode);

        // Clean up temp file
        Storage::delete($filepath);

        if ($exitCode === 3) {
            return back()->with('error', 'Restore failed: ' . implode("\n", $output));
        }

        $logger = new LogController();
        $logger->logActivity($request, auth()->user()->email . " restored from backup: " . $uploadedFile->getClientOriginalName());

        return redirect('/segrefruit')->with('success', 'Database restored successfully.');
    }
}
