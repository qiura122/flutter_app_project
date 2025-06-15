import 'package:flutter/material.dart';
import 'database/db_helper.dart';
import 'model/kontak.dart';

class FormKontak extends StatefulWidget {
  final Kontak? kontak;

  FormKontak({this.kontak});

  @override
  _FormKontakState createState() => _FormKontakState();
}

class _FormKontakState extends State<FormKontak> {
  DbHelper db = DbHelper();

  TextEditingController? nama;
  TextEditingController? lastNama;
  TextEditingController? telepon;
  TextEditingController? email;
  TextEditingController? perusahaan;

  @override
  void initState() {
    nama = TextEditingController(
      text: widget.kontak == null ? '' : widget.kontak!.nama,
    );
    telepon = TextEditingController(
      text: widget.kontak == null ? '' : widget.kontak!.telepon,
    );
    email = TextEditingController(
      text: widget.kontak == null ? '' : widget.kontak!.email,
    );
    perusahaan = TextEditingController(
      text: widget.kontak == null ? '' : widget.kontak!.perusahaan,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form Kontak')),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: TextField(
              controller: nama,
              decoration: InputDecoration(
                labelText: 'Nama',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: TextField(
              controller: telepon,
              decoration: InputDecoration(
                labelText: 'Telepon',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: TextField(
              controller: email,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: TextField(
              controller: perusahaan,
              decoration: InputDecoration(
                labelText: 'Perusahaan',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ElevatedButton(
              child:
                  (widget.kontak == null)
                      ? Text('Simpan', style: TextStyle(color: Colors.black))
                      : Text('Update', style: TextStyle(color: Colors.black)
                      ),
              onPressed: () {
                upsertKontak();
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> upsertKontak() async {
    if (widget.kontak != null) {
      await db.updateKontak(Kontak.fromMap({
        'id': widget.kontak!.id,
        'nama': nama!.text,
        'lastNama': lastNama!.text,
        'telepon': telepon!.text,
        'email': email!.text,
        'perusahaan': perusahaan!.text,
      }));
      Navigator.pop(context, 'update');
    } else {
      await db.saveKontak(Kontak(
        nama: nama!.text,
        telepon: telepon!.text,
        email: email!.text,
        perusahaan: perusahaan!.text,
      ));
      Navigator.pop(context, 'save');
    }
  }
}
