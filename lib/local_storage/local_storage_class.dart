import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE items(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        aAcc1 TEXT
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'measurement_data',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // Create new item (wifi_data)
  static Future<int> createItem(
      double? acc1, Map<String, dynamic> wifiData) async {
    final db = await SQLHelper.db();

    final data = {'acc1': acc1};
    final id = await db.insert(
      'items', data,
      // conflictAlgorithm: sql.ConflictAlgorithm.replace
    );
    return id;
  }

  // Read all items (wifi_data)
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('items', orderBy: "id");
  }
}
