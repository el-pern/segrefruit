<?php

namespace App\Http\Controllers;

use App\Models\Log;
use Illuminate\Http\Request;

class LogController extends Controller
{
    public function logActivity(Request $request, $log_msg){

        date_default_timezone_set('Asia/Manila');
        $curDate = date('Y-m-d h:i:s A');

        $inputs = [
            'info' => $log_msg,
            'log_date' => $curDate
        ];

        Log::create($inputs);
    }
}
