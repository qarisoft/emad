import 'package:emad_app/app/log.dart';
import 'package:emad_app/data/data_source/db/sqlite.dart';
import 'package:emad_app/presentation/common/freezed_data_classes.dart';
import 'package:sqflite/sqflite.dart';

abstract class Model {
  abstract String table;

  int? id;

  static Future<List<Map<String, dynamic>>> all(String table) async {
    final db =  Db.database;
    return db.query(table, orderBy: "id");
  }

  // Future<List<Map<String, dynamic>>> getItem(int id) async {
  //   final db = await Db.db();
  //   return db.query(table, where: "id = ?", whereArgs: [id], limit: 1);
  // }

  Map<String, Object?> getData();

  Future<List<Map<String, dynamic>>> create() async {
    Database db = Db.database;
    await db.insert(
      table,
      getData(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    List<Map<String, dynamic>>data= await db.rawQuery('''
    SELECT *
    FROM (
      SELECT *, ROW_NUMBER() OVER (ORDER BY employee_id DESC) AS rn
      FROM $table
    ) AS subquery
    WHERE rn = 1;
        ''');
    return data;
  }
}

class Product extends Model {
  String? _createdAt;
  String? _updatedAt;

  ProductModel data;

  Product({
    required String name,
    required double price,
  }) : data = ProductModel(name:name, price:price) ;



  @override
  String table = 'products';

  @override
  Map<String, Object?> getData() {
    return data.toJson();
  }
}
