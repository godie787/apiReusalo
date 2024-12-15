<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;

class Producto extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'productos';
    protected $primaryKey = 'id_producto';
    public $timestamps = true;
    protected $keyType = 'int';
    protected $casts = [
        'imagenes' => 'array',
    ];


    public function categoria(){
        return $this->belongsTo(Categoria::class, 'id_categoria');
    }
}
