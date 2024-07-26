import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'scanned_qrs.db');
    return await openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE scans(id INTEGER PRIMARY KEY AUTOINCREMENT, code TEXT, timestamp TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertScan(String code, String timestamp) async {
    final db = await database;
    await db.insert(
      'scans',
      {'code': code, 'timestamp': timestamp},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getScans() async {
    final db = await database;
    return db.query('scans');
  }
}
