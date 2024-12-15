<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class VentaRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'id_usuario' => 'required|exists:usuarios,id_usuario',
            'total_venta' => 'required|numeric|min:0',
            'forma_pago' => 'required|in:transferencia,debito,credito,a_convenir',
            'carro' => 'required|array',
            'carro.*.id_producto' => 'required|exists:productos,id_producto',
            'carro.*.nombre' => 'required|string|max:255',
            'carro.*.precio' => 'required|numeric|min:0',
        ];
    }

    public function messages(): array
    {
        return [
            'id_usuario.required' => 'El ID del usuario es obligatorio.',
            'id_usuario.exists' => 'El usuario no existe.',
            'total_venta.required' => 'El total de la venta es obligatorio.',
            'forma_pago.required' => 'La forma de pago es obligatoria.',
            'forma_pago.in' => 'La forma de pago no es válida.',
            'carro.required' => 'El carrito de productos es obligatorio.',
            'carro.*.id_producto.required' => 'El ID del producto es obligatorio.',
            'carro.*.id_producto.exists' => 'El producto no existe.',
            'carro.*.nombre.required' => 'El nombre del producto es obligatorio.',
            'carro.*.precio.required' => 'El precio del producto es obligatorio.',
        ];
    }
}
