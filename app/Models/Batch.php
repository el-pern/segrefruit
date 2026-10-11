<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Batch extends Model
{
    use HasFactory;

    protected $table = 'batchs';
    protected $fillable = [
        'batch_num', 'start_time', 'end_time'
    ];
}
