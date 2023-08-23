<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Bien;
use App\Models\DependenciaUsuaria;
class BiensMovimiento extends Model
{
    protected $guarded=['id'];
    public function bien(){
        return $this->belongsTo(Bien::class);
    }
    public function dependenciaUsuaria(){
        return $this->belongsTo(DependenciaUsuaria::class);
    }
}
