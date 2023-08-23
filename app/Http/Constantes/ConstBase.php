<?php

namespace App\Http\Constantes;

use Illuminate\Support\Collection;
use ReflectionClass;

class ConstBase
{
    /**
     * Obtiene un arreglo asociativo con las constantes de la clase.
     * Tener en cuenta que la clase hija hereda todas las constantes de
     * la clase padre, por eso también se obtendrán las constantes de la
     * clase padre.
     * @return array
     */
    public static function obtenerConstantes(): array {
        $clase = get_called_class();
        $instancia = new $clase;
        return (new ReflectionClass($instancia))->getConstants();
    }

    /**
     * Retorna un collect array asociativo 'id y value',
     * donde el valor de la constante sera el id, y el nombre de la constante sera el value.
     *
     * ademas de esto recibe un parametro donde si no queremos que se el campo se llame value,
     * entonces le pasamos el valor el mismo como parametro ejemplo value, name, nombre etc.
     * [ {id:1, value:'MI_CONSTANTE1'}, {id:2, value:'MI_CONSTANTE2'}]
     * @return Collection
     */
    public static function invertirKeyValue($nameCampo = 'value'): Collection {
        $clase = get_called_class();
        $instancia = new $clase;
        $elements = (new ReflectionClass($instancia))->getConstants();
        $resp = [];
        foreach ($elements as $value => $key) {
            array_push($resp, ['id' => $key, $nameCampo => $value]);
        }
        $a = collect($resp);
        return collect($resp);
    }
}
