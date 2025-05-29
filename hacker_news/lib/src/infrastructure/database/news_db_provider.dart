import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'package:hacker_news/src/models/item_model.dart';
import 'package:hacker_news/src/infrastructure/database/db_schema.dart';
import 'package:hacker_news/src/infrastructure/database/db_utils.dart';
import 'package:hacker_news/src/repository/news_datasource.dart';

class NewsDbProvider implements NewsDataSource, ItemCache {
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

  @override
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

  @override
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

  @override
  Future<void> clearCache() async {
    final db = await database;
    await db.delete(itemsTableName);
  }
}
