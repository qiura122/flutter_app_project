import 'package:flutter_app_project/Modul_SQLite/Modul_Kontak/model/kontak.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper._internal();
  static Database? _database;

  final String tableName = 'tabelkontak';
  final String columnId = 'id';
  final String columnName = 'nama';
  final String columnPhone = 'telepon';
  final String columnEmail = 'email';
  final String columnCompany = 'perusahaan';

  DbHelper._internal();
  factory DbHelper() => _instance;

  Future<Database> get _db async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'kontak.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    var sql = "CREATE TABLE IF NOT EXISTS $tableName ("
        "$columnId INTEGER PRIMARY KEY AUTOINCREMENT, "
        "$columnName TEXT, "
        "$columnPhone TEXT, "
        "$columnEmail TEXT, "
        "$columnCompany TEXT)";
        await db.execute(sql);
  }
  Future<int?> saveKontak(Kontak kontak) async {
    final db = await _db;
    return await db.insert(tableName, kontak.toMap());
  }

  Future<List?> getAllKontak() async {
    var dbClient = await _db;
    var result = await dbClient.query(tableName, columns: [
      columnId,
      columnName,
      columnPhone,
      columnEmail,
      columnCompany
    ]);
    return result..toList();
  }

  Future<int?> updateKontak(Kontak kontak) async {
    var dbClient = await _db;
    return await dbClient.update(tableName, kontak.toMap(),
        where: '$columnId = ?', whereArgs: [kontak.id]);
  }

  Future<int?> deleteKontak(int id) async {
    var dbClient = await _db;
    return await dbClient.delete(tableName, where: '$columnId = ?', whereArgs: [id]);
  }
}