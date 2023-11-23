import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart'; // Import the dart:io library for the File class

class ProfilPage extends StatefulWidget {
  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _selectedImage; // Variabel untuk menyimpan foto yang dipilih

  Future<void> _ambilFotoKamera() async {
    final XFile? foto = await _imagePicker.pickImage(source: ImageSource.camera);
    if (foto != null) {
      setState(() {
        _selectedImage = foto;
      });
    }
  }

  Future<void> _ambilFotoGaleri() async {
    final XFile? foto = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (foto != null) {
      setState(() {
        _selectedImage = foto;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Menampilkan foto yang dipilih dengan border lingkaran
            Container(
              width: 100, // Sesuaikan ukuran sesuai kebutuhan
              height: 100, // Sesuaikan ukuran sesuai kebutuhan
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.blue, // Warna border
                  width: 2.0, // Lebar border
                ),
              ),
              child: _selectedImage != null
                  ? ClipOval(
                child: Image.file(
                  File(_selectedImage!.path), // Perbaiki di sini
                  width: 100, // Sesuaikan ukuran sesuai kebutuhan
                  height: 100, // Sesuaikan ukuran sesuai kebutuhan
                  fit: BoxFit.cover,
                ),
              )
                  : Icon(
                Icons.person, // Icon default jika belum ada foto yang dipilih
                size: 50, // Sesuaikan ukuran sesuai kebutuhan
                color: Colors.blue, // Warna ikon default
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _ambilFotoKamera,
              child: Text('Ambil Foto dari Kamera'),
            ),
            ElevatedButton(
              onPressed: _ambilFotoGaleri,
              child: Text('Ambil Foto dari Galeri'),
            ),
          ],
        ),
      ),
    );
  }
}