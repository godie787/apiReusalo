<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{

    public function up(): void
    {
        Schema::create('productos', function (Blueprint $table) {
            $table->id('id_producto');
            $table->string('nombre');
            $table->unsignedBigInteger('id_categoria')->nullable(); //a esta migración le quité el nullable, en el archivo modify_id_categoria_in_productos_table
            $table->integer('precio');
            $table->text('descripcion')->nullable();
            $table->enum('estado', ['disponible', 'vendido'])->default('disponible');
            $table->json('imagenes')->nullable(); // Para almacenar múltiples URLs de imágenes
            $table->foreign('id_categoria')->references('id_categoria')->on('categorias')->onDelete('set null');

            $table->timestamps();
            $table->softDeletes();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('productos');
    }
};
