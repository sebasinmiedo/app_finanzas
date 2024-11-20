import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'transacciones.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE transacciones(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        tipo TEXT,
        cantidad REAL,
        fecha TEXT
      )
    ''');
  }

  Future<int> agregarTransaccion(
      String tipo, double cantidad, String fecha) async {
    Database db = await database;
    return await db.insert('transacciones', {
      'tipo': tipo,
      'cantidad': cantidad,
      'fecha': fecha,
    });
  }

  Future<List<Map<String, dynamic>>> obtenerTransacciones() async {
    Database db = await database;
    return await db.query('transacciones');
  }

  Future<int> eliminarTransaccion(int id) async {
    Database db = await database;
    return await db.delete('transacciones', where: 'id = ?', whereArgs: [id]);
  }
}
