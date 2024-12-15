<?php

namespace App\Http\Controllers;

use App\Models\Categoria;
use Illuminate\Http\Request;
use App\Http\Requests\CategoriaRequest;

class CategoriasController extends Controller
{

    public function index()
    {
        return Categoria::all();
    }

    public function store(CategoriaRequest $request)
    {
        $categoria = new Categoria();
        $categoria->nombre = $request->nombre;
        $categoria->descripcion = $request->descripcion;
        $categoria->save();
        return $categoria;
    }

    public function show(Categoria $categoria)
    {
        return $categoria;
    }

    public function update(CategoriaRequest $request, Categoria $categoria)
    {
        $categoria->nombre = $request->nombre;
        $categoria->descripcion = $request->descripcion;
        $categoria->save();
        return response()->json([
            'message' => 'Categoría actualizada exitosamente',
            'data' => $categoria
        ], 200);
    }

    public function destroy(Categoria $categoria)
    {
        $categoria->delete();
        return response()->json([
            'message' => 'Categoría eliminada exitosamente',
            'data' => $categoria
        ], 200);
    }
}   
