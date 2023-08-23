<?php

namespace Database\Seeders;

use App\Models\TipoMovimiento;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class TipoMovimientosTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $data = [
            ['id' => '1','nombre' => 'INCORPORACION'],
            ['id' => '2','nombre' => 'REASIGNACION'],
            ['id' => '3','nombre' => 'DESINCORPORACION']
        ];
        // DB::table('tipo_movimientos')->insert($data);
        TipoMovimiento::insert($data);
    }
}
