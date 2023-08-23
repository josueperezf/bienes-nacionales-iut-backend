<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Categoria;
class Denominacion extends Model
{
    public function categoria(){
        return $this->belongsTo(Categoria::class);
    }
}
