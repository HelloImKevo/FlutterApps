import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'dart:async';
import 'package:hacker_news/src/models/item_model.dart';
import 'package:hacker_news/src/infrastructure/database/db_schema.dart';
import 'package:hacker_news/src/infrastructure/database/db_utils.dart';

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
      itemsTableName,
      columns: null,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      final map = preprocessDbMap(maps.first, ['deleted', 'dead']);
      return ItemModel.fromJson(map);
    }

    return null;
  }

  Future<int> addItem(ItemModel item) async {
    final db = await database;

    // Preprocess the item to convert boolean values to integers
    final itemMap =
        convertBooleansToIntegers(item.toJson(), ['deleted', 'dead']);

    return await db.insert(
      itemsTableName,
      itemMap,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
