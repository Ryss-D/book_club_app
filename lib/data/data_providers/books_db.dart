import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart' as path;

class DBHelper {
  //Database is a type provided by sqflite papcakge
  static Future<Database> database() async {
    //getDatabaesPath method search for the location dependly of the operaing system
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(dbPath, 'books.db'),
      //this is the method who will be executed if we try to open the
      //db file and didnt find anythings
      onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE books(isbn TEXT PRIMARY KEY, title TEXT, author TEXT, number_of_pages TEXT, cover TEXT)');
      },
      version: 1,
    );
  }

  Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DBHelper.database();
    db.insert(
      table,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getData() async {
    final db = await DBHelper.database();
    return db.query('books');
  }
}
