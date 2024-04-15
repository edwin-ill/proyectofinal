import 'dart:async';
import 'package:proyectofinal/api/enviar_reporte.dart';
import 'package:proyectofinal/api/obtener_reporte.dart';
import 'package:proyectofinal/db/report.dart';
// import 'package:sqflite/sqflite.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper._internal();

  factory DbHelper() => _instance;

  DbHelper._internal();

  bool? hasUser;

//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDatabase();
//     return _database!;
//   }

//   Future<Database> _initDatabase() async {
//     String path = join(await getDatabasesPath(), 'civil_defense.db');
//     Database civilDefenseDB =
//         await openDatabase(path, version: 1, onCreate: _createDb);
//     bool hasUser = await hasUsers(civilDefenseDB);
//     // Insertar usuarios por defecto solo si no existen usuarios
//     if (hasUser == false) {
//       User admin = User(id: 0, name: 'admin', password: 'admin');
//       await civilDefenseDB.insert('users', admin.toMap());
//     }
//     return civilDefenseDB;
//   }

//   void _createDb(Database db, int version) async {
//     await db.execute('''
//       CREATE TABLE report (
//         id INTEGER PRIMARY KEY AUTOINCREMENT,
//         title TEXT,
//         date TEXT,
//         description TEXT,
//         latitude INTEGER,
//         longitude INTEGER,
//         photo TEXT,
//         state INTEGER,
//         feedback TEXT
//       )
//     ''');

//     await db.execute('''
//       CREATE TABLE users (
//         id INTEGER PRIMARY KEY AUTOINCREMENT,
//         name TEXT,
//         password TEXT
//       )
//     ''');
//   }

  Future<bool> insertReport(Report report) async {
    EnviarReporte rs = EnviarReporte();
    return await rs.enviarReporte(
        'https://adamix.net/defensa_civil/def/nueva_situacion.php',
        report.toMapForApi());
    // Database db = await database;
    // return await db.insert('report', report.toMap());
  }

//   Future<int> deleteReport(int id) async {
//     Database db = await database;
//     return await db.delete('report', where: 'id = ?', whereArgs: [id]);
//   }

  Future<List<dynamic>> getReports(String token) async {
    return await ObternerReporte().obtenerReporte(
        'https://adamix.net/defensa_civil/def/situaciones.php',
        {'token': token});
  }

//   Future<int> insertUser(User user) async {
//     Database db = await database;
//     return await db.insert('users', user.toMap());
//   }

//   Future<int> deleteUser(int id) async {
//     Database db = await database;
//     return await db.delete('users', where: 'id = ?', whereArgs: [id]);
//   }

//   Future<int> updateUserPassword(String actualPass, String pass) async {
//     Database db = await database;
//     return await db.update('users',{'password': pass},  where: 'password = ?', whereArgs: [actualPass]);
//   }

//   Future<List<Map<String, dynamic>>> getUser(User user) async {
//     Database db = await database;
//     return await db.query('users',
//       where: 'name = ? AND password = ?',
//       whereArgs: [user.name, user.password],);
//   }

//   Future<bool> hasUsers(Database db) async {
//     List<Map<String, dynamic>> users = await db.query('users');
//     return users.isNotEmpty;
//   }
}
