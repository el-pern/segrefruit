<?php

namespace App\Imports;

use App\Models\Dmg_fruit;
use App\Models\Fruit;
use Carbon\Carbon;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

class FruitsImport implements ToModel, WithHeadingRow
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
        $status = strtolower(trim($row['status'] ?? ''));

        $createdAt = !empty($row['date_and_time'])
            ? Carbon::createFromFormat('m/d/Y h:i:s A', trim($row['date_and_time']))
            : now();

        if ($status === 'accepted') {
            return Fruit::firstOrCreate([
                'fruit_name' => $row['fruit'],
                'created_at' => $createdAt,
            ]);
        } elseif ($status === 'rejected') {
            return Dmg_fruit::firstOrCreate([
                'fruit_name' => $row['fruit'],
                'created_at' => $createdAt,
            ]);
        }

        return null; // skip rows with unknown status
    }
}
