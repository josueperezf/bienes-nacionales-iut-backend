<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\TipoMovimiento;
class DetalleTipoMovimiento extends Model
{
    public function tipoMovimiento(){
        return $this->belongsTo(TipoMovimiento::class);
    }
}
