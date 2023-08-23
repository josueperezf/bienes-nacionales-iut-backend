<?php

namespace Database\Seeders;

use App\Models\Coordinacion;
use App\Models\DependenciaUsuaria;
use App\Models\Subcoordinacion;
use App\Models\UnidadAdministrativa;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class CoordinacionsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Coordinacion::create([
            'nombre'     => 'DESINCORPORACION',
        ]);
        Coordinacion::create([
            'nombre'     => 'TACHIRA',
        ]);
        Subcoordinacion::create([
            'coordinacion_id'=>1,
            'ciudad'     => 'DESINCORPORACION',
            'nombre'     => 'DESINCORPORACION',
            'direccion'     => 'DESINCORPORACION',
        ]);
        UnidadAdministrativa::create([
            'subcoordinacion_id'=>1,
            'nombre'     => 'DESINCORPORACION',
            'telefono'     => '0000-0000000',
        ]);
        DependenciaUsuaria::create([
            'tipo_dependencia_usuaria_id'=>3,
            'unidad_administrativa_id'=>1,
            'nombre'     => 'DESINCORPORACION',
        ]);

        // DB::table('coordinacions')->insert([
        //     'id' => 1, 'nombre'     => 'DESINCORPORACION',
        // ]);
        // DB::table('coordinacions')->insert([
        //     'id' => 2, 'nombre'     => 'TACHIRA',
        // ]);
        // DB::table('subcoordinacions')->insert([
        //     'id' => 1,
        //     'coordinacion_id'=>1,
        //     'ciudad'     => 'DESINCORPORACION',
        //     'nombre'     => 'DESINCORPORACION',
        //     'direccion'     => 'DESINCORPORACION',
        // ]);
        // DB::table('unidad_administrativas')->insert([
        //     'id' => 1,
        //     'subcoordinacion_id'=>1,
        //     'nombre'     => 'DESINCORPORACION',
        //     'telefono'     => '0000-0000000',
        // ]);
        // DB::table('dependencia_usuarias')->insert([
        //     'id' => 1,
        //     'tipo_dependencia_usuaria_id'=>3,
        //     'unidad_administrativa_id'=>1,
        //     'nombre'     => 'DESINCORPORACION',
        // ]);
    }
}
