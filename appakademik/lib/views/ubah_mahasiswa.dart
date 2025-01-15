import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/mahasiswa_controller.dart';
import '../models/mahasiswa.dart';

class EditMahasiswaView extends StatefulWidget {
  final Mahasiswa mahasiswa;
  EditMahasiswaView({required this.mahasiswa});
  @override
  _EditMahasiswaViewState createState() => _EditMahasiswaViewState();
}

class _EditMahasiswaViewState extends State<EditMahasiswaView> {
  final MahasiswaController controller = Get.find();
// Kontroler untuk input data
  final TextEditingController npmController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController telpController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController tempatLahirController = TextEditingController();
  final TextEditingController tanggalLahirController = TextEditingController();
  final TextEditingController sexController = TextEditingController();
  @override
  void initState() {
    super.initState();
// Inisialisasi kontroler dengan data mahasiswa yang ada
    npmController.text = widget.mahasiswa.npm;
    namaController.text = widget.mahasiswa.nama;
    emailController.text = widget.mahasiswa.email;
    telpController.text = widget.mahasiswa.telp;
    alamatController.text = widget.mahasiswa.alamat;
    tempatLahirController.text = widget.mahasiswa.tempatLahir;
    tanggalLahirController.text = widget.mahasiswa.tanggalLahir;
    sexController.text = widget.mahasiswa.sex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Mahasiswa"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: npmController,
                decoration: InputDecoration(labelText: "NPM"),
              ),
              TextField(
                controller: namaController,
                decoration: InputDecoration(labelText: "Nama"),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: "Email"),
              ),
              TextField(
                controller: telpController,
                decoration: InputDecoration(labelText: "Telepon"),
              ),
              TextField(
                controller: alamatController, // Inputan untuk alamat
                decoration: InputDecoration(labelText: "Alamat"),
              ),
              TextField(
                controller: tempatLahirController,
                decoration: InputDecoration(labelText: "Tempat Lahir"),
              ),
              TextField(
                controller: tanggalLahirController,
                decoration:
                    InputDecoration(labelText: "Tanggal Lahir (YYYYMM-DD)"),
              ),
              TextField(
                controller: sexController,
                decoration: InputDecoration(labelText: "Jenis Kelamin "),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
// Membuat objek mahasiswa yang diperbarui tanpa foto
                  final updatedMahasiswa = Mahasiswa(
                    id: widget.mahasiswa.id,
                    npm: npmController.text,
                    nama: namaController.text,
                    email: emailController.text,
                    telp: telpController.text,
                    alamat: alamatController.text,
                    tempatLahir: tempatLahirController.text,
                    tanggalLahir: tanggalLahirController.text,
                    sex: sexController.text,
                    photo: widget.mahasiswa.photo,
// Pertahankan foto yang sama
                  );
// Memanggil metode update di controller
                  controller.updateMahasiswa(
                      widget.mahasiswa.id!, updatedMahasiswa);
                  Get.back(); // Kembali ke halaman sebelumnya
                },
                child: Text("Simpan Perubahan"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}