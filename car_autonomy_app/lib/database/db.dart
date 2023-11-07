import 'dart:io';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

class DB {
  DB._();

  static final DB instance = DB._();

  static Database? _database;

  get dataBase async {
    if (_database != null) return _database;

    return await _initDataBase();
  }

  _initDataBase() async {
    if (Platform.isWindows || Platform.isLinux) {
      sqfliteFfiInit();
    }
    databaseFactory = databaseFactory;
    var databasesPath = await getDatabasesPath();
    return await openDatabase(
      databasesPath,
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(db, versao) async {
    await db.execute(_cars);
  }

  String get _cars => 'CREATE TABLE cars '
      '(name TEXT PRIMARY KEY,'
      ' brand TEXT,'
      ' year INTEGER,'
      ' urbanConsum REAL,'
      ' highwayConsum REAL'
      ')';
}
