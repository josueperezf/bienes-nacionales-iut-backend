<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class RequestSubcoordinacionCreate extends FormRequest
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
            // 'coordinacion_id' =>'required',
            'coordinacion_id' => 'exists:App\Models\Coordinacion,id',
            'ciudad' =>'required|min:3|max:100',
            'nombre'=>'required|min:2|max:100|unique:subcoordinacions',
            'direccion'   =>'required|min:3|max:100'
        ];
    }
}
