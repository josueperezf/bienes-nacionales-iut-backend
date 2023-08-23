<?php

namespace Database\Seeders;

use App\Models\Categoria;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class CategoriasTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $data=[
            ['id'=>1, 'codigo'=> '16010','nombre'=> 'Equipos de telecomunicaciones'],
            ['id'=>2, 'codigo'=> '18020','nombre'=> 'Equipos de enseñanza, deporte y recreación'],
            ['id'=>3, 'codigo'=> '18060','nombre'=> 'Instrumentos musicales'],
            ['id'=>4, 'codigo'=> '20010','nombre'=> 'Mobiliario y equipos de oficina'],
            ['id'=>5, 'codigo'=> '20020','nombre'=> 'Equipos de procesamiento de datos '],
            ['id'=>6, 'codigo'=> '20090','nombre'=> 'Mobiliario y equipos de alojamiento'],
        ];
        // DB::table('categorias')->insert($data);
        Categoria::insert($data);

    }
}
