<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Coordinacion extends Model
{
    // una coordinacion puede tener muchas subcoordinaciones
    public function subcoodinaciones() {
        return $this->hasMany(Subcoordinacion::class);
    }
}
