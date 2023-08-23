<?php

namespace App\Http\Requests;
use Illuminate\Routing\Route;
use Illuminate\Foundation\Http\FormRequest;

class RequestSubcoordinacionUpdate extends FormRequest
{
    public $route;
    public function __construct(Route $route)
    {
        $this->route=$route;
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
            'coordinacion_id' => 'exists:App\Models\Coordinacion,id',
            'ciudad' =>'required|min:3|max:100',
            'nombre'    =>'required|min:3|max:100|unique:subcoordinacions,nombre,'.$this->route->__get('subcoordinacion'),
            'direccion'   =>'required|min:3|max:100'
        ];
    }
}
