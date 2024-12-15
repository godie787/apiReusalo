<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class EventoRequest extends FormRequest
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
            'descripcion' => 'required|string',
            'fecha_inicio' => 'nullable|date',
            'fecha_termino' => 'nullable|date|after_or_equal:fecha_inicio',
            'ubicacion' => 'required|string|max:255',
            'id_tipo' => 'nullable|exists:tipos_evento,id_tipo',
            'id_usuario' => 'required',
        ];
    }

    /**
     * Get the custom messages for validation errors.
     */
    public function messages()
    {
        return [
            'nombre.required' => 'El nombre del evento es obligatorio.',
            'nombre.string' => 'El nombre debe ser una cadena de texto.',
            'nombre.max' => 'El nombre no debe exceder los 255 caracteres.',
            'descripcion.required' => 'La descripción del evento es obligatoria.',
            'descripcion.string' => 'La descripción debe ser una cadena de texto.',
            'fecha_inicio.date' => 'La fecha de inicio debe tener un formato de fecha válido.',
            'fecha_termino.date' => 'La fecha de término debe tener un formato de fecha válido.',
            'fecha_termino.after_or_equal' => 'La fecha de término debe ser igual o posterior a la fecha de inicio.',
            'ubicacion.required' => 'La ubicación del evento es obligatoria.',
            'ubicacion.string' => 'La ubicación debe ser una cadena de texto.',
            'ubicacion.max' => 'La ubicación no debe exceder los 255 caracteres.',
            'id_tipo.exists' => 'El tipo de evento seleccionado no existe.',
            'id_usuario.required' => 'El id usuario es obligatorio'
        ];
    }

}
