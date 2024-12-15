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
        Schema::create('eventos', function (Blueprint $table) {
            $table->id('id_evento');
            $table->string('nombre');
            $table->longText('descripcion');
            $table->date('fecha_inicio')->nullable();
            $table->date('fecha_termino')->nullable();
            $table->string('ubicacion');
            $table->unsignedBigInteger('id_tipo')->nullable();
            $table->foreign('id_tipo')->references('id_tipo')->on('tipos_evento')->onDelete('cascade');
            $table->timestamps();
            $table->softDeletes();

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('eventos');
    }
};
