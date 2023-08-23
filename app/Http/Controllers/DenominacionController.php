<?php

namespace App\Http\Controllers;
use App\Models\Denominacion;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Response;

class DenominacionController extends Controller {

    public function porCategoria($categoria_id) {
        $data = Denominacion::where('categoria_id','=',$categoria_id)->select(['id','codigo','nombre'])->get();
        return Response::json(['denominacions'=>$data],201);
    }
}
