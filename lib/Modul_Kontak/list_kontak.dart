import 'package:flutter/material.dart';
import 'form_kontak.dart';
import 'database/db_helper.dart';
import 'model/kontak.dart';

class ListKontak extends StatefulWidget {
  const ListKontak({Key? key}) : super(key: key);
  @override
  _ListKontakState createState() => _ListKontakState();
}

class _ListKontakState extends State<ListKontak> {
  List<Kontak> listKontak = [];
  DbHelper db = DbHelper();

  @override
  void initState() {
    _getAllKontak();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Kontak App"))),
      body: ListView.builder(
        itemCount: listKontak.length,
        itemBuilder: (context, index) {
          Kontak kontak = listKontak[index];
          return Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ListTile(
              leading: Icon(Icons.person, size: 50),
              title: Text('${kontak.nama}'),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text("Email: ${kontak.email}"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text("Telepon: ${kontak.telepon}"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text("Perusahaan: ${kontak.perusahaan}"),
                  ),
                ],
              ),
              trailing: FittedBox(
                fit: BoxFit.fill,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        _openFormEdit(kontak);
                      },
                      icon: Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () {
                        AlertDialog hapus = AlertDialog(
                          title: Text("Information"),
                          content: Container(
                            height: 100,
                            child: Column(
                              children: [
                                Text(
                                  "Yakin ingin menghapus Data ${kontak.nama}?",
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                _deleteKontak(kontak, index);
                                Navigator.pop(context);
                              },
                              child: Text("Ya"),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Tidak"),
                            ),
                          ],
                        );
                        showDialog(
                          context: context,
                          builder: (context) => hapus,
                        );
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _openFormCreate();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> _getAllKontak() async {
    var list = await db.getAllKontak();

    setState(() {
      listKontak.clear();
      list!.forEach((kontak) {
        listKontak.add(Kontak.fromMap(kontak));
      });
    });
  }

  Future<void> _deleteKontak(Kontak kontak, int index) async {
    await db.deleteKontak(kontak.id!);
    setState(() {
      listKontak.removeAt(index);
    });
  }

  Future<void> _openFormCreate() async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FormKontak()),
    );
    if (result == 'save') {
      _getAllKontak();
    }
  }

  Future<void> _openFormEdit(Kontak kontak) async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FormKontak(kontak: kontak)),
    );
    if (result == 'update') {
      _getAllKontak();
    }
  }
}
