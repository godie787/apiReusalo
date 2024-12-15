<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Venta extends Model
{
    use HasFactory;

    protected $table = 'ventas';
    public $timestamps = false; // Desactiva los timestamps automáticos

    protected $fillable = [
        'id_usuario',
        'total_venta',
        'forma_pago',
        'carro',
        'fecha_venta',
    ];

    protected $casts = [
        'carro' => 'array', // Indica que el campo `carro` es un JSON y debe ser tratado como un array
    ];
}
