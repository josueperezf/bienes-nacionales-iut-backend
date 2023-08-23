<?php

namespace App\Http\Controllers;

use App\Http\Constantes\TipoDependenciaUsuariasConst;
use App\Models\Bien;
use App\Models\Coordinacion;
use Illuminate\Http\Request;
use App\Models\Subcoordinacion;
use App\Models\DependenciaUsuaria;
use App\Models\UnidadAdministrativa;
// use App\Models\TipoDependenciaUsuaria;
use Illuminate\Support\Facades\Response;
use App\Http\Requests\RequestDependenciaUsuariaCreate;
use App\Http\Requests\RequestDependenciaUsuariaUpdate;


class DependenciaUsuariaController extends Controller
{
    public function index(Request $request) {
        return DependenciaUsuaria::Buscador($request->all());
    }

    public function create() {
        // la siguiente linea es para utilizar las contante, ejemplo {"ALMACEN": 1,"DEPARTAMENTO": 2,"DESINCORPORACION": 3}
        // TipoDependenciaUsuariasConst::obtenerConstantes();

        // la siguiente linea es para realmente utilizar las constante, la siguiente linea retorn el numero 2, que es el valor de la constante llamada DEPARTAMENTO en la clase 'TipoDependenciaUsuariasConst'
        // return TipoDependenciaUsuariasConst::DEPARTAMENTO;


        // tipoDependenciaUsuaria es un collect que contiene array de constante, tiene el mismo resultado que llamar a la base de datos, pero mas rapido
        return TipoDependenciaUsuariasConst::invertirKeyValue('nombre')->where('id', '!=', TipoDependenciaUsuariasConst::DESINCORPORACION);

        // la siguiente linea hace lo mismo que lo anterior pero yendo a la base de datos
        // return $tipoDependenciaUsuaria = TipoDependenciaUsuaria::where('id','<>',TipoDependenciaUsuariasConst::DESINCORPORACION)->select('id','nombre')->get();
    }

    public function store(RequestDependenciaUsuariaCreate $request)
    {
        $dependenciaUsuaria=new DependenciaUsuaria($request->all());
        $dependenciaUsuaria->save();
        return Response::json(['message'=>'Operacion Exitosa'],201);
    }

    public function porUnidadAdministrativa($unidad_administrativa_id)
    {
        return [
            'dependenciaUsuarias'=>DependenciaUsuaria::where('unidad_administrativa_id','=',$unidad_administrativa_id)->get()
        ];
    }

    public function show(DependenciaUsuaria $dependenciaUsuaria)
    {
        $biens = Bien::
        join("biens_movimientos",function($join){
            $join->on("biens_movimientos.bien_id" ,"=", "biens.id");
            $join->where('biens_movimientos.actual','=',2);
        })
        ->leftJoin("marcas","marcas.id" ,"=", "biens.marca_id")
        ->leftJoin("denominacions","denominacions.id" ,"=", "biens.denominacion_id")
        ->where('biens_movimientos.dependencia_usuaria_id','=',$dependenciaUsuaria->id)
        ->select(['biens.*',
                    'marcas.nombre as marca_nombre',
                    'marcas.id as marca_id',
                    'denominacions.nombre as denominacion_nombre',
                    'denominacions.id as denominacion_id',
                ])->get();
        $dependenciaUsuaria->unidadAdministrativa;
        return [
            'biens'=>$biens,
            'dependenciaUsuarias'=>$dependenciaUsuaria,
        ];
    }

    public function edit(DependenciaUsuaria $dependenciaUsuaria)
    {
        $coordinaciones = Coordinacion::where('id','!=',1)->get();
        $subcoordinaciones = Subcoordinacion::where('id','!=',1)->get();
        $dependenciaUsuaria->unidadAdministrativa->subcoordinacion->coordinacion;
        $unidadAdministrativas = UnidadAdministrativa::where('id','!=',1)->get();
        // $tipoDependenciaUsuarias = TipoDependenciaUsuaria::where('id','!=',3)->get();
        $tipoDependenciaUsuarias = TipoDependenciaUsuariasConst::invertirKeyValue('nombre')->where('id', '!=', TipoDependenciaUsuariasConst::DESINCORPORACION);
        return [
            'coordinaciones'=>$coordinaciones,
            'subcoordinaciones'=>$subcoordinaciones,
            'tipoDependenciaUsuarias'=>$tipoDependenciaUsuarias,
            'unidadAdministrativas'=>$unidadAdministrativas,
            'dependenciaUsuaria'=> $dependenciaUsuaria
        ];
    }

    public function update(Request $request, $id)
    {
        $totalAlmacenEnDependenciaUsuaria=0;
        $dependenciaUsuaria=DependenciaUsuaria::withTrashed()->where('id','=',$id)->first();
        if(($request->deleted_at==null) and  ($dependenciaUsuaria->deleted_at!=null)){
            if($dependenciaUsuaria->tipo_dependencia_usuaria_id==1){
                $totalAlmacenEnDependenciaUsuaria=DependenciaUsuaria::where('id','!=',$id)->where('tipo_dependencia_usuaria_id','=', TipoDependenciaUsuariasConst::ALMACEN)->count();
            }
            if($totalAlmacenEnDependenciaUsuaria>0)
            {
                return  Response::json(
                    [
                        'errors'=>[
                            'dependencia'=>
                            ['No pueden existir dos almacenes activos de manera simultaneas en la misma coordinacion']
                            ]
                        ], 422);
            }else{
                $dependenciaUsuaria->restore();
            }
        }
        else{
            $dependenciaUsuaria=DependenciaUsuaria::where('id','=',$id)->first();
            if($request->tipo_dependencia_usuaria_id!=1)
                $totalAlmacenEnDependenciaUsuaria=0;
            else
                $totalAlmacenEnDependenciaUsuaria=DependenciaUsuaria::where('id','!=',$id)->where('tipo_dependencia_usuaria_id','=', TipoDependenciaUsuariasConst::ALMACEN)->count();
            if($totalAlmacenEnDependenciaUsuaria>0)
            {
                return  Response::json(
                    [
                        'errors'=>[
                            'dependencia'=>
                            ['No pueden existir dos almacenes activos de manera simultaneas en la misma coordinacion']
                            ]
                        ], 422);
            }else{
                $dependenciaUsuaria->fill($request->all())->update();
            }
        }
        return Response::json(['mensaje'=>'Operacion Exitosa'],200);
    }

    public function destroy(DependenciaUsuaria $dependenciaUsuaria)
    {
        $dependenciaUsuaria->delete();
        return Response::json(['message'=>'Eliminacion Exitosa'],200);
    }
}
