import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:yourlibrary/src/models/notes_model.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  get database async {
    if (_database != null) return _database;
    _database = await initDb();
    return _database;
  }

  Future<Database> initDb() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    final path = join(appDir.path, 'YourLibrary.db');
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE Notes(
          id  INTEGER PRIMARY KEY,
          matter TEXT, 
          note TEXT
        )      
      ''');
    });
  }

  Future<int> insert(Notes newElement) async {
    final db = await database;
    final newId = await db.insert('Notes', newElement.toJson());
    return newId;
  }

  Future<dynamic> list() async {
    final db = await database;
    final result = await db.query('Notes');
    return result.isNotEmpty
        ? result.map((t) => Notes.fromJson(t)).toList()
        : [];
  }

  Future<int> updateData(Notes newElement) async {
    final db = await database;
    return db.update('Notes', newElement.toJson(),
        where: 'id = ?', whereArgs: [newElement.id]);
  }
}
