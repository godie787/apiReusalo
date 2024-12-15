<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class TipoEventoRequest extends FormRequest
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
            'nombre_tipo' => 'required|string|max:255|unique:tipos_evento,nombre_tipo'
        ];
    }

    /**
     * Get the custom messages for validation errors.
     */
    public function messages()
    {
        return [
            'nombre_tipo.required' => 'El nombre del tipo de evento es obligatorio.',
            'nombre_tipo.string' => 'El nombre debe ser una cadena de texto.',
            'nombre_tipo.max' => 'El nombre no debe exceder los 255 caracteres.',
            'nombre_tipo.unique' => 'El nombre del tipo de evento ya existe en el sistema.'
        ];
    }

}
