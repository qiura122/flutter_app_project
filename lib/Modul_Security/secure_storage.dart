import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageExample extends StatefulWidget {
  @override
  _SecureStorageExampleState createState() => _SecureStorageExampleState();
}

class _SecureStorageExampleState extends State<SecureStorageExample> {
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  String _storedValue = '';

  Future<void> _saveData() async {
    await secureStorage.write(key: 'token', value: '1234567890abcdef');

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Data berhasil disimpan secara aman!')),
    );
  }

  Future<void> _readData() async {
    String? value = await secureStorage.read(key: 'token');

    setState(() {
      _storedValue = value ?? 'Tidak ada data.';
    });
  }

  Future<void> _deleteData() async {
    await secureStorage.delete(key: 'token');

    setState(() {
      _storedValue = 'Data dihapus.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Secure Storage')),

      body: Padding(
        padding: const EdgeInsets.all(16.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            ElevatedButton(onPressed: _saveData, child: Text('Simpan Token')),
            ElevatedButton(onPressed: _readData, child: Text('Baca Token')),
            ElevatedButton(onPressed: _deleteData, child: Text('Hapus Token')),
            SizedBox(height: 20),
            Text('Isi Token: $_storedValue'),
          ],
        ),
      ),
    );
  }
}
