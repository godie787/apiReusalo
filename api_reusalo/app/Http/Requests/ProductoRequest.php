<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ProductoRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'nombre' => 'required|string|max:255',
            'id_categoria' => 'nullable|exists:categorias,id_categoria',
            'precio' => 'required|integer|min:0',
            'descripcion' => 'nullable|string',
            'estado' => 'required|in:disponible,vendido,pendiente',
            'imagenes' => 'nullable|array',
            'imagenes.*' => 'url' // Cada URL en el array de imágenes debe ser válida
        ];
    }

    /**
     * Get the custom messages for validation errors.
     */
    public function messages()
    {
        return [
            'nombre.required' => 'El nombre del producto es obligatorio.',
            'nombre.string' => 'El nombre debe ser una cadena de texto.',
            'nombre.max' => 'El nombre no debe exceder los 255 caracteres.',
            'id_categoria.exists' => 'La categoría seleccionada no existe.',
            'precio.required' => 'El precio del producto es obligatorio.',
            'precio.integer' => 'El precio debe ser un número entero.',
            'precio.min' => 'El precio no puede ser negativo.',
            'descripcion.string' => 'La descripción debe ser una cadena de texto.',
            'estado.required' => 'El estado del producto es obligatorio.',
            'estado.in' => 'El estado debe ser "disponible", "vendido" o pendiente.',
            'imagenes.array' => 'Las imágenes deben estar en un formato de lista.',
            'imagenes.*.url' => 'Cada imagen debe ser una URL válida.'
        ];
    }

}
