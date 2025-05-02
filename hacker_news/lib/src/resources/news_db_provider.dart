import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'dart:async';
import '../models/item_model.dart';
import 'db_schema.dart';

class NewsDbProvider {
  Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = '${documentsDirectory.path}/items.db';

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(createItemsTable);
      },
    );
  }

  Future<ItemModel?> fetchItem(int id) async {
    final db = await database;
    final maps = await db.query(
      'Items',
      columns: null,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return ItemModel.fromJson(maps.first);
    }

    return null;
  }

  Future<int> addItem(ItemModel item) async {
    final db = await database;
    return await db.insert(
      'Items',
      item.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
