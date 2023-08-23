<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class RequestDependenciaUsuariaCreate extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */
    public function rules()
    {
        // ALMACEN = 1;
        // DEPARTAMENTO = 2;
        // DESINCORPORACION = 3;

        return [
            // 'tipo_dependencia_usuaria_id' => 'required',
            'tipo_dependencia_usuaria_id' => ['required', 'numeric', 'between:1,2,3'], // solo puede tener numeros y los valores permitidos son el 1, 2 Y 3, creo que el 3 lo deberia de quitar pero no se por ello despues no quiera traer la que tengo oculta en db del tipo 3, entonces lo dejo asi
            'unidad_administrativa_id' => ['required', 'numeric'],
            'nombre'    => ['required', 'min:3', 'max:100'],
        ];
    }
}
