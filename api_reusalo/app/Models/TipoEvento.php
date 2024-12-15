<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;

class TipoEvento extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'tipos_evento';
    protected $primaryKey = 'id_tipo';
    
    public function eventos(){
        return $this->hasMany(Evento::class, 'id_tipo');
    }
}
