<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\DB;
use App\Models\Subcoordinacion;
use App\Models\DependenciaUsuaria;


class UnidadAdministrativa extends Model
{
    use SoftDeletes;
    protected $guarded=['id'];
    protected $dates=['deleted_at'];
    public function scopeBuscador($query,$parametros=[])
    {
        $todos=false;
        (!empty($parametros['buscar']))? $buscar=$parametros['buscar'] : $buscar='';
        (!empty($parametros['sort']))? $sort=$parametros['sort'] : $sort='id';
        (!empty($parametros['direction']) && $parametros['direction'] == 'asc' )? $direction = $parametros['direction'] : $direction='desc';
        (!empty($parametros['pageSize'])) ? $pageSize=''.$parametros['pageSize'] : $pageSize ='100000000000';
        if(!empty($parametros['todos'])) $todos=true;
        // !!IMPORTANTE, para cuando cree esto no sabia que laravel tiene el when que evalua si la variable existe agrega la condicion sql, si no lo pone, ejemlo

        /**
         * si existe el termino, agrega ese termino al where
         * si existe categoria_id, agrega al where, si no el where no tendra esa condicion
         * $vacantes = Vacante::
                when($termino, function($q) {
                    $q->where('titulo', 'LIKE', '%'.$termino.'%')
                      ->orWhere('empresa', 'LIKE', '%'.$termino.'%');
                })->when($categoria_id, function($q) {
                    $q->where('categoria_id', $categoria_id);
                })
                ->when($salario_id, function($q) {
                    $q->where('salario_id', $salario_id);
                })
            ->get();
            //->toSql();
         */

        if($todos){
            return $query
                         ->withTrashed()
                         ->leftJoin("subcoordinacions","subcoordinacions.id" ,"=", "unidad_administrativas.subcoordinacion_id")
                         ->where('subcoordinacions.id','!=',1)
                         ->Where(DB::raw("
                                CONCAT(
                                    subcoordinacions.nombre,' ',
                                    unidad_administrativas.nombre, ' ',
                                    unidad_administrativas.telefono, ' ',
                                    CASE
                                WHEN(unidad_administrativas.deleted_at is null )THEN 'ACTIVO'
                                WHEN(unidad_administrativas.deleted_at is not null)THEN 'INACTIVO'
                            END )"),'like',"%$buscar%"
                            )
                         ->select([
                             'unidad_administrativas.*',
                             'subcoordinacions.nombre as subcoordinacion_nombre',
                             DB::raw("(CASE
                                WHEN(unidad_administrativas.deleted_at is null)THEN 'ACTIVO'
                                WHEN(unidad_administrativas.deleted_at is not null)THEN 'INACTIVO'
                            END) as estatus")
                             ])
                         ->orderBy($sort, $direction)->paginate($pageSize);
        }else{
            return $query->leftJoin("subcoordinacions","subcoordinacions.id" ,"=", "unidad_administrativas.subcoordinacion_id")
                            ->where('unidad_administrativas.id', '!=', 1) // este es para que NO muestre la dependencia usuaria que llame DESINCORPORACIONES
                            ->where(function ( $q) use ($buscar) {
                                $q->where('subcoordinacions.id','like','%'.$buscar.'%')
                                ->orWhere('telefono', 'LIKE', "%$buscar%")
                                ->orWhere('unidad_administrativas.nombre', 'LIKE', "%$buscar%")
                                ->orWhere('subcoordinacions.nombre', 'LIKE', "%$buscar%")
                                ->orWhere(DB::raw("
                                            CONCAT(CASE
                                            WHEN(unidad_administrativas.deleted_at is null )THEN 'ACTIVO'
                                            WHEN(unidad_administrativas.deleted_at is not null)THEN 'INACTIVO'
                                        END )"),'like',"%$buscar%");
                            })
                         ->select([
                             'unidad_administrativas.*',
                             'subcoordinacions.nombre as subcoordinacion_nombre',
                             DB::raw("(CASE
                                WHEN(unidad_administrativas.deleted_at is null)THEN 'ACTIVO'
                                WHEN(unidad_administrativas.deleted_at is not null)THEN 'INACTIVO'
                            END) as estatus")
                             ])
                         ->orderBy($sort, $direction)->paginate($pageSize);

                         //* sql resultante
                        //  select
                        //         count(*) as aggregate
                        // from
                        //         `unidad_administrativas`
                        //         left join `subcoordinacions` on `subcoordinacions`.`id` = `unidad_administrativas`.`subcoordinacion_id`
                        // where
                        //         `unidad_administrativas`.`id` != 1
                        //         and (
                        //                 `subcoordinacions`.`id` like '%%'
                        //                 or `telefono` LIKE '%%'
                        //                 or `unidad_administrativas`.`nombre` LIKE '%%'
                        //                 or `subcoordinacions`.`nombre` LIKE '%%'
                        //                 or CONCAT(
                        //                         CASE
                        //                                 WHEN(unidad_administrativas.deleted_at is null )THEN 'ACTIVO'
                        //                                 WHEN(unidad_administrativas.deleted_at is not null)THEN 'INACTIVO'
                        //                         END ) like '%%')
                        //         and `unidad_administrativas`.`deleted_at` is null


        }
    }
    public function subcoordinacion()
    {
    	return $this->belongsTo(Subcoordinacion::class);
    }
    public function dependenciaUsuarias()
    {
    	return $this->hasMany(DependenciaUsuaria::class);
    }
}
