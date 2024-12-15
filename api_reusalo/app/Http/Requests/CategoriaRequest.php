<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CategoriaRequest extends FormRequest
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
            'nombre' => 'required|string|max:255|unique:categorias,nombre',
            'descripcion' => 'nullable|string'
        ];
    }

    /**
     * Get the custom messages for validation errors.
     */
    public function messages()
    {
        return [
            'nombre.required' => 'El nombre de la categoría es obligatorio.',
            'nombre.string' => 'El nombre debe ser una cadena de texto.',
            'nombre.max' => 'El nombre no debe exceder los 255 caracteres.',
            'nombre.unique' => 'El nombre de la categoría ya existe en el sistema.',
            'descripcion.string' => 'La descripción debe ser una cadena de texto.'
        ];
    }

}
