<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Response;

use App\Models\Coordinacion;
use App\Models\Subcoordinacion;

use App\Http\Requests\RequestSubcoordinacionCreate;
use App\Http\Requests\RequestSubcoordinacionUpdate;
use Illuminate\Support\Facades\Log;

class SubcoordinacionController extends Controller
{
    public function index(Request $request)
    {
        return Subcoordinacion::Buscador($request->all());
    }

    public function create()
    {
        //return Coordinacion::pluck('id','nombre');
       return Coordinacion::where('id','!=',1)->select('id','nombre')->get();
    }
    public function porCoordinacion(Coordinacion $coordinacion) {
        $subcoordinaciones = $coordinacion->subcoodinaciones;
        return Response::json([...$subcoordinaciones],200);
    }


    public function store(RequestSubcoordinacionCreate $request)
    {
        // en RequestSubcoordinacionCreate tebngo la validacion para ver si el id de la coordinacion existe,
        // la consulta se puede personalizar segun la documentacion oficial, pero para este ejemplo no quise hacerlo https://laravel.com/docs/8.x/validation#rule-exists
        $subcoordinacion = new Subcoordinacion($request->all());
        $subcoordinacion->save();
        return Response::json(['message'=>'Operacion Exitosa2'], 201);
    }

    public function show(Subcoordinacion $subcoordinacion)
    {
        if($subcoordinacion->id==1)
            return  Response::json(['errors'=>['id'=>['Subcoordinacion no autoriazada']]], 422);
        $subcoordinacion->unidadAdministrativas;
        return Response::json(['subcoordinacion'=>$subcoordinacion],200);
    }

    public function edit(Subcoordinacion $subcoordinacion)
    {
        $coordinacion= Coordinacion::pluck('id','nombre');
        return Response::json(['subcoordinacion'=>$subcoordinacion,'coordinacion'=>$coordinacion],200);
    }

    public function update(RequestSubcoordinacionUpdate $request, $id)
    {
        $subcoordinacion=Subcoordinacion::withTrashed()->where('id','=',$id)->first();
        if(($request->deleted_at==null) and  ($subcoordinacion->deleted_at!=null))
            $subcoordinacion->restore();
        else
            $subcoordinacion->fill($request->all())->update();
        return Response::json(['mensaje'=>'Operacion Exitosa'],200);
    }

    public function destroy(Subcoordinacion $subcoordinacion)
    {
        // si de la subcoordinacion aun no se ha registrado una unidadAdministrativa, la podemos eliminar fisicamente de la db, de lo contrario no
        if($subcoordinacion->unidadAdministrativas->count() == 0 ) {
            $subcoordinacion->forceDelete();
        }
        $subcoordinacion->delete();
        return Response::json(['message'=>'Eliminacion Exitosa'],200);
    }
}
