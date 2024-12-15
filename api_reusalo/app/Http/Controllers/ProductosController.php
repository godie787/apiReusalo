<?php

namespace App\Http\Controllers;

use App\Models\Producto;
use Illuminate\Http\Request;
use App\Http\Requests\ProductoRequest;

class ProductosController extends Controller
{

    public function index()
    {
        return Producto::all();
    }

    /*      $table->string('nombre');
            $table->unsignedBigInteger('id_categoria')->nullable(); //a esta migración le quité el nullable, en el archivo modify_id_categoria_in_productos_table
            $table->integer('precio');
            $table->text('descripcion')->nullable();
            $table->enum('estado', ['disponible', 'vendido'])->default('disponible');
            $table->json('imagenes')->nullable(); // Para almacenar múltiples URLs de imágenes*/

    public function store(ProductoRequest $request)
    {
        $producto = new Producto();

        $producto->nombre = $request->nombre;
        $producto->id_categoria = $request->id_categoria;
        $producto->precio = $request->precio;
        $producto->descripcion = $request->descripcion;
        $producto->estado = $request->estado;
        $producto->imagenes = $request->imagenes;
        $producto->id_usuario = $request->id_usuario;

        $producto->save();
        return $producto;
    }

    public function show(Producto $producto)
    {
        return $producto;
    }

    public function update(ProductoRequest $request, Producto $producto)
    {
        $producto->nombre = $request->nombre;
        $producto->id_categoria = $request->id_categoria;
        $producto->precio = $request->precio;
        $producto->descripcion = $request->descripcion;
        $producto->estado = $request->estado;
        $producto->imagenes = $request->imagenes;
        $producto->id_usuario = $request->id_usuario;

        $producto->save();
        return response()->json([
            'message' => 'Producto actualizado exitosamente',
            'data' => $producto
        ], 200);
    }

    public function destroy(Producto $producto)
    {
        $producto->delete();
        return response()->json([
            'message' => 'Producto eliminado exitosamente',
            'data' => $producto
        ], 200);
    }
}
