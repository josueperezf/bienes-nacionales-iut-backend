<?php

namespace Database\Seeders;

use App\Models\TipoDependenciaUsuaria;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Seeder;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class TipoDependenciaUsuariasTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $data= [
            ['id'=> 1, 'nombre'     => 'ALMACEN'],
            ['id'=> 2, 'nombre'     => 'DEPARTAMENTO'],
            ['id'=> 3, 'nombre'     => 'DESINCORPORACION'],
        ];

        // DB::table('tipo_dependencia_usuarias')->insert($data);
        TipoDependenciaUsuaria::insert($data);
    }
}
