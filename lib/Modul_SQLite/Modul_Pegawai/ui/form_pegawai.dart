import 'package:flutter/material.dart';
import 'package:flutter_app_project/Modul_SQLite/Modul_Pegawai/database/db_helper.dart';
import 'package:flutter_app_project/Modul_SQLite/Modul_Pegawai/model/pegawai.dart';

class FormPegawai extends StatefulWidget {
  final Pegawai? pegawai;

  FormPegawai(this.pegawai);

  @override
  _FormPegawaiState createState() => _FormPegawaiState();
}

class _FormPegawaiState extends State<FormPegawai> {
  DbHelper db = DbHelper();

  TextEditingController? firstName;
  TextEditingController? lastName;
  TextEditingController? mobileNo;
  TextEditingController? email;

  @override
  void initState() {
    firstName = TextEditingController(
        text: widget.pegawai == null ? '' : widget.pegawai!.firstName);
    lastName = TextEditingController(
        text: widget.pegawai == null ? '' : widget.pegawai!.lastName);
    mobileNo = TextEditingController(
        text: widget.pegawai == null ? '' : widget.pegawai!.mobileNo);
    email = TextEditingController(
        text: widget.pegawai == null ? '' : widget.pegawai!.email);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)));

    return Scaffold(
      appBar: AppBar(
        title: Text('Form Pegawai'),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          TextField(
            controller: firstName,
            decoration: InputDecoration(
              labelText: 'FirstName',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: lastName,
            decoration: InputDecoration(
              labelText: 'LastName',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: mobileNo,
            decoration: InputDecoration(
              labelText: 'Mobile No',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: email,
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            child: (widget.pegawai == null)
                ? Text(
                    'Add',
                    style: TextStyle(color: Colors.white),
                  )
                : Text(
                    'Update',
                    style: TextStyle(color: Colors.white),
                  ),
            style: style,
            onPressed: () {
              upsertPegawai();
            },
          ),
        ],
      ),
    );
  }

  Future<void> upsertPegawai() async {
    if (widget.pegawai != null) {
      // update
      await db.updatePegawai(Pegawai.fromMap({
        'id': widget.pegawai!.id,
        'firstName': firstName!.text,
        'lastName': lastName!.text,
        'mobileNo': mobileNo!.text,
        'email': email!.text,
      }));
      Navigator.pop(context, 'update');
    } else {
      // insert
      await db.savePegawai(Pegawai(
        firstName: firstName!.text,
        lastName: lastName!.text,
        mobileNo: mobileNo!.text,
        email: email!.text,
      ));
      Navigator.pop(context, 'save');
    }
  }
}
