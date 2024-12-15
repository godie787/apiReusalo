<?php

namespace App\Http\Controllers;

use App\Models\TipoEvento;
use Illuminate\Http\Request;
use App\Http\Requests\TipoEventoRequest;

class TipoEventoController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return TipoEvento::all();
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(TipoEventoRequest $request)
    {
        $tipoEvento = new TipoEvento();
        $tipoEvento->nombre_tipo = $request->nombre_tipo;
        $tipoEvento->save();
        return $tipoEvento;
    }

    /* 
    * En el método show se hizo la búsqueda manual usando $id, en lugar de usar el modelo TipoEvento directamente.
    * Esto se debe a que Laravel intenta buscar por una columna llamada 'id' al utilizar el route model binding
    * de forma automática, pero en este caso la clave primaria es 'id_tipo'.
    */
    public function show($id)
    {
        $tipoEvento = TipoEvento::find($id);
        if (!$tipoEvento) {
            return response()->json(['message' => 'Tipo de evento no encontrado'], 404);
        }
        return $tipoEvento;
    }
    
    /**
     * Update the specified resource in storage.
     */
    public function update(TipoEventoRequest $request, TipoEvento $tipoEvento)
    {
        $tipoEvento->nombre_tipo = $request->nombre_tipo;
        $tipoEvento->save();
        return response()->json([
            'message' => 'Tipo de evento actualizado exitosamente',
            'data' => $tipoEvento
        ], 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(TipoEvento $tipoEvento)
    {
        $tipoEvento->delete();
        return response()->json([
            'message' => 'Tipo de evento eliminado exitosamente',
            'data' => $tipoEvento
        ], 200);
    }
}
