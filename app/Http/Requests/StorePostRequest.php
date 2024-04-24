<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rules\File;

class StorePostRequest extends FormRequest
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
            'body' => ['nullable', 'string'],
            'attachments' => 'array|max:50',
            'attachments.*' => [
                'file',
                File::types([
                    'jpg', 'jpeg', 'png', 'gif', 'webp',
                    'mp3', 'mp4',
                    'doc', 'docx', 'pdf', 'txt', 'zip'
                ])->max(50 * 1024 * 1024) //50MB
            ],
            'user_id' => ['numeric']
        ];
    }

    protected function prepareForValidation()
    {

        $this->merge([
           'user_id' => auth()->user()->id,
           'body' => $this->input('body') ?: ''
        ]);
    }
}
