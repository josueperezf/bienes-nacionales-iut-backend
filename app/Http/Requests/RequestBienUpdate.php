<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Routing\Route;

class RequestBienUpdate extends FormRequest
{
    public $route;
    public function __construct(Route $route)
    {
        $this->route = $route;
    }

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
            'denominacion_id'   =>'required|integer',
            'marca_id'          =>'required|integer',
            'codigo'            => 'required|min:2|max:100|unique:biens,codigo,'.$this->route->__get('bien')->id,
            'serial'            =>'required|min:2|max:20',
            'monto'             =>'required|min:2|max:10'
        ];
    }
}
