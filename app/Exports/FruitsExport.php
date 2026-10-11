<?php

namespace App\Exports;

use App\Models\Dmg_fruit;
use App\Models\Fruit;
use Carbon\Carbon;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class FruitsExport implements FromCollection, WithHeadings
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        $accepted = Fruit::all()->map(function ($item) {
            return [
                'fruit_name' => $item->fruit_name,
                'status'     => 'accepted',
                'created_at' => $item->created_at
                    ? Carbon::parse($item->created_at)->format('m/d/Y h:i:s A')
                    : null,
            ];
        });

        $rejected = Dmg_fruit::all()->map(function ($item) {
            return [
                'fruit_name' => $item->fruit_name,
                'status'     => 'rejected',
                'created_at' => $item->created_at
                    ? Carbon::parse($item->created_at)->format('m/d/Y h:i:s A')
                    : null,
            ];
        });

        return $accepted->merge($rejected)->sortBy('created_at')->values();
    }

    public function headings(): array
    {
        return ['Fruit', 'Status', 'Date and Time'];
    }
}
