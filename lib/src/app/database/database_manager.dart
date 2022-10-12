import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseManager {
  DatabaseManager._();
  static final DatabaseManager instance = DatabaseManager._();
  static Database? _database;

  get database async {
    if (_database != null) return _database;

    return await _initDatabase();
  }

  _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'truck_driver.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(Database db, int versao) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS truck_driver (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        age INTEGER,
        cep TEXT,
        profession TEXT,
        serviceType TEXT
      );
    ''');
  }
}