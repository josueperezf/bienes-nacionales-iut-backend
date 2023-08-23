<?php

namespace App\Http\Requests;
use Illuminate\Routing\Route;
use Illuminate\Foundation\Http\FormRequest;

class RequestMarcaUpdate extends FormRequest
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
            'nombre'=>'required|min:2|max:100|unique:marcas,nombre,'.$this->route->__get('marca'),
        ];
    }
}
