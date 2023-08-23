<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class RequestBienCreate extends FormRequest
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

        return [
            'denominacion_id'   =>'exists:App\Models\Denominacion,id',
            'marca_id'          =>'exists:App\Models\Marca,id',
            'codigo'            =>'required|min:2|max:10|unique:biens',
            'serial'            =>'required|min:1|max:20',
            'monto'             =>'required|min:1|max:20'
        ];
    }
}
