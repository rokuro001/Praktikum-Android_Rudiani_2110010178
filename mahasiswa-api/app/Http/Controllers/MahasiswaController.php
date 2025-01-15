<?php

namespace App\Http\Controllers;

use App\Models\Mahasiswa;
use Illuminate\Http\Request;

class MahasiswaController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Mahasiswa::all();
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'npm' => 'required|string|unique:mahasiswas',
            'nama' => 'required|string',
            'tempat_lahir' => 'required|string',
            'tanggal_lahir' => 'required|date',
            'sex' => 'required|string',
            'alamat' => 'required|string',
            'telp' => 'required|string',
            'email' => 'required|string|email|unique:mahasiswas',
            'photo' => 'nullable|string',
        ]);
        return Mahasiswa::create($request->all());
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        return Mahasiswa::findOrFail($id);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        $mahasiswa = Mahasiswa::findOrFail($id);
        //$request->validate([
        //'npm' => 'sometimes|required|string|unique:mahasiswa,npm,'.$mahasiswa->id,
        //'email' => 'sometimes|required|string|email|unique:mahasiswa,email,'.$mahasiswa->id,
    //]);

    $mahasiswa->update($request->all());
    return $mahasiswa;
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $mahasiswa = Mahasiswa::findOrFail($id);
        $mahasiswa->delete();
        return response()->noContent();
    }
}
