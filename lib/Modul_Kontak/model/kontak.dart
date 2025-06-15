class Kontak {
  int? id;
  String? nama;
  String? telepon;
  String? email;
  String? perusahaan;

  Kontak({this.id, this.nama, this.telepon, this.email, this.perusahaan});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    if (id != null) {
      map['id'] = id;
    }
    map['nama'] = nama;
    map['telepon'] = telepon;
    map['email'] = email;
    map['perusahaan'] = perusahaan;

    return map;
  }

  Kontak.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.nama = map['nama'];
    this.telepon = map['telepon'];
    this.email = map['email'];
    this.perusahaan = map['perusahaan'];
  }
}
