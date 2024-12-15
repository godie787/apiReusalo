<?php

namespace App\Http\Controllers;

use App\Models\Evento;
use Illuminate\Http\Request;
use App\Http\Requests\EventoRequest;

class EventosController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Evento::all();
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(EventoRequest $request)
    {
        $evento = new Evento();
        $evento->nombre = $request->nombre;
        $evento->descripcion = $request->descripcion;
        $evento->fecha_inicio = $request->fecha_inicio;
        $evento->fecha_termino = $request->fecha_termino;
        $evento->ubicacion = $request->ubicacion;
        $evento->id_tipo = $request->id_tipo;
        $evento->id_usuario = $request->id_usuario;
        $evento->save();
        return $evento;
    }

    /**
     * Display the specified resource.
     */
    public function show(Evento $evento)
    {
        return $evento;
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(EventoRequest $request, Evento $evento)
    {
        $evento->nombre = $request->nombre;
        $evento->descripcion = $request->descripcion;
        $evento->fecha_inicio = $request->fecha_inicio;
        $evento->fecha_termino = $request->fecha_termino;
        $evento->ubicacion = $request->ubicacion;
        $evento->id_tipo = $request->id_tipo;
        $evento->id_usuario = $request->id_usuario;

        $evento->save();
        return response()->json([
            'message' => 'Evento actualizado exitosamente',
            'data' => $evento
        ], 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Evento $evento)
    {
        $evento->delete();
        return response()->json([
            'message' => 'Evento eliminado exitosamente',
            'data' => $evento
        ], 200);
    }
}
