<?php

namespace App\Http\Controllers;

use App\Models\Venta;
use App\Models\Producto;
use App\Http\Requests\VentaRequest;

class VentaController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Venta::all(); // Devuelve todas las ventas
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(VentaRequest $request)
    {
        $venta = new Venta();

        $venta->id_usuario = $request->id_usuario; // Usuario que realiza la compra
        $venta->total_venta = $request->total_venta;
        $venta->forma_pago = $request->forma_pago;
        $venta->carro = $request->carro; // Carrito en formato JSON
        $venta->fecha_venta = $request->fecha_venta;

        $venta->save();

        // Cambiar el estado de los productos a "vendido"
        foreach ($request->carro as $item) {
            $producto = Producto::find($item['id_producto']);
            if ($producto) {
                $producto->estado = 'vendido';
                $producto->save();
            }
        }

        return response()->json([
            'message' => 'Venta creada exitosamente',
            'data' => $venta
        ], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Venta $venta)
    {
        return $venta; // Devuelve los datos de una venta específica
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(VentaRequest $request, Venta $venta)
    {
        $venta->id_usuario = $request->id_usuario;
        $venta->total_venta = $request->total_venta;
        $venta->forma_pago = $request->forma_pago;
        $venta->carro = $request->carro;

        $venta->save();

        return response()->json([
            'message' => 'Venta actualizada exitosamente',
            'data' => $venta
        ], 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Venta $venta)
    {
        $venta->delete();
        return response()->json([
            'message' => 'Venta eliminada exitosamente',
            'data' => $venta
        ], 200);
    }
}
