import 'package:flutter/material.dart';

class Form2 extends StatefulWidget {
  @override
  _Form2State createState() => _Form2State();
}

class _Form2State extends State<Form2> {
  final _formKey = GlobalKey<FormState>();

  double nilaiSlider = 50;
  bool nilaiChackbox = false;
  bool nilaiSwitch = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form Input Lanjutan')),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: new InputDecoration(
                      hintText: "email@example.com",
                      labelText: 'Email',
                      icon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    obscureText: true,
                    decoration: new InputDecoration(
                      labelText: "Password",
                      icon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
                CheckboxListTile(
                  title: Text("Setuju dengan syarat dan ketentuan"),
                  subtitle: Text(
                    "Silahkan baca syarat dan ketentuan sebelum melanjutkan",
                  ),
                  value: nilaiChackbox,
                  onChanged: (value) {
                    setState(() {
                      nilaiChackbox = value!;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text("Aktifkan Notifikasi"),
                  value: nilaiSwitch,
                  activeTrackColor: Colors.deepOrange,
                  activeColor: Colors.deepOrangeAccent,
                  onChanged: (value) {
                    setState(() {
                      nilaiSwitch = value;
                    });
                  },
                ),
                // Slider(
                //   value: nilaiSlider,
                //   min: 0,
                //   max: 100,
                //   onChanged: (value) {
                //     setState(() {
                //       nilaiSlider = value;
                //     });
                //   },
                // ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrangeAccent,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                  child: Text('Submit', style: TextStyle(color: Colors.white)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
