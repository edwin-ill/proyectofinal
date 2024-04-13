import 'dart:async';
import 'package:path/path.dart';
import 'package:proyectofinal/db/report.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper._internal();

  factory DbHelper() => _instance;

  static Database? _database;

  DbHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), 'civil_defense.db');
    return await openDatabase(path, version: 1, onCreate: _createDb);
  }

  void _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE report (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        date TEXT,
        description TEXT,
        latitude INTEGER,
        longitude INTEGER,
        photo TEXT,
        state INTEGER,
        feedback TEXT
      )
    ''');
  }

  Future<int> insertReport(Report report) async {
    Database db = await database;
    return await db.insert('report', report.toMap());
  }

  Future<int> deleteReport(int id) async {
    Database db = await database;
    return await db.delete('report', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> getReports() async {
    Database db = await database;
    return await db.query('report');
  }
}
