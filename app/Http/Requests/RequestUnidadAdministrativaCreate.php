<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class RequestUnidadAdministrativaCreate extends FormRequest
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
    public function rules() {
        return [
            'subcoordinacion_id' => 'exists:App\Models\Subcoordinacion,id',
            'nombre'    =>'required|min:3|max:100|unique:unidad_administrativas,nombre',
            'telefono' =>'required|min:12|max:13',
        ];
    }
}
