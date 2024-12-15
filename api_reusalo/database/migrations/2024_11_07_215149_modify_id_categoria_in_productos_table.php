<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('productos', function (Blueprint $table) {
            // Paso 1: Eliminar la clave foránea temporalmente
            $table->dropForeign(['id_categoria']);

            // Paso 2: Hacer que id_categoria sea NOT NULL
            $table->unsignedBigInteger('id_categoria')->nullable(false)->change();

            // Paso 3: Restablecer la clave foránea sin `set null`
            $table->foreign('id_categoria')->references('id_categoria')->on('categorias')->onDelete('cascade');
        });
    }

    public function down(): void
    {
        Schema::table('productos', function (Blueprint $table) {
            // Revertir los cambios
            $table->dropForeign(['id_categoria']);
            $table->unsignedBigInteger('id_categoria')->nullable()->change();
            $table->foreign('id_categoria')->references('id_categoria')->on('categorias')->onDelete('set null');
        });
    }

};
