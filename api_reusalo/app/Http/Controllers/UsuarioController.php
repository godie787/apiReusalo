<?php

namespace App\Http\Controllers;

use App\Models\Usuario;
use Illuminate\Http\Request;
use App\Http\Requests\UsuarioRequest;

class UsuarioController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Usuario::all(); // Devuelve todos los usuarios
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(UsuarioRequest $request)
    {
        $usuario = new Usuario();

        $usuario->nombre = $request->nombre;
        $usuario->email = $request->email;
        $usuario->telefono = $request->telefono;
        $usuario->password = bcrypt($request->password); // Cifrar la contraseña
        $usuario->uid = $request->uid;

        $usuario->save();
        return response()->json([
            'message' => 'Usuario creado exitosamente',
            'data' => $usuario
        ], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Usuario $usuario)
    {
        return $usuario; // Devuelve los datos del usuario especificado
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UsuarioRequest $request, Usuario $usuario)
    {
        $usuario->nombre = $request->nombre;
        $usuario->email = $request->email;
        $usuario->telefono = $request->telefono;

        // Solo actualiza la contraseña si se proporciona
        if ($request->password) {
            $usuario->password = bcrypt($request->password);
        }

        $usuario->uid = $request->uid;

        $usuario->save();
        return response()->json([
            'message' => 'Usuario actualizado exitosamente',
            'data' => $usuario
        ], 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Usuario $usuario)
    {
        $usuario->delete();
        return response()->json([
            'message' => 'Usuario eliminado exitosamente',
            'data' => $usuario
        ], 200);
    }
}
