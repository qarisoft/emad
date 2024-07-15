import 'dart:convert';

import 'package:emad_app/domain/models/product/_product_model.dart';

import '../../data/db.dart';

abstract class Model {
  Map<String, dynamic> toJson();
  int? get id;
}
extension AB on Model {
  Map<String,dynamic> toDb() {
    return toJson().map(
          (key, value) {
        if (value.runtimeType.toString() == 'bool') {
          value = value ? 1 : 0;
        }
        return MapEntry(key, value);
      },
    );
  }

  Future<int> save() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      final db = await SqlHelper.db();
      final id = await db.insert(
        tableN,
        toDb()
      );
      return id;
    } catch (e, s) {
      return -1;
    }
  }

  int get pk => id ?? 0;

  Future<int> update() async {
    if (pk > 0) {
      try {
        final db = await SqlHelper.db();
        final a = await db.update(tableN, toJson(), where: "id=?", whereArgs: [pk]);
        return a;
      } catch (e, s) {
        print(s);
        return -1;
      }
    }
    return -1;
  }

  Future<int> delete() async {
    await Future.delayed(const Duration(seconds: 1));
    if (id == null) {
      return -1;
    }
    if (id! > 0) {
      final db = await SqlHelper.db();
      final res = await db.delete(tableN, where: "id=?", whereArgs: [id]);
      return res;
    }
    return -1;
  }

  String get nam => runtimeType.toString().replaceFirst('_\$', '').replaceFirst('Impl', '');

  String get tableN => "${nam.toLowerCase()}s";

  Map<String, dynamic> toJ() {
    return toJson().map((key, value) {
      final v = value.runtimeType.toString().startsWith('List') ? jsonEncode(value) : value;
      return MapEntry(key, v);
    });
  }

  String tableName() {
    return '${name(this).toLowerCase()}s';
  }

  String sql() {
    final Map<String, String> a = toJson().map((key, dynamic value) => MapEntry(key, "$key ${ap(value)}"));
    String s = "";
    a.forEach((key, value) {
      if (key != 'id' || key != 'created_at' || key != 'updated_at') {
        s = "$s $value,";
      }
    });
    return '''
          CREATE TABLE ${tableName()}(
                id INTEGER PRIMARY KEY  NOT NULL,
                $s
                created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                updated_at TIMESTAMP
          );
            ''';
  }
}

ap(v) {
  final a = name(v);
  if (a.startsWith('int') || a == 'bool') {
    return 'INTEGER default 0';
  }
  if (a == 'String') {
    return 'TEXT';
  }
  return 'TEXT';
}

String name(v) {
  return v.runtimeType.toString().replaceFirst('_\$', '').replaceFirst('Impl', '');
}

extension OrderItemsH on List<OrderItem> {
  calPrice() {
    double totalPrice = 0;
    forEach((element) {
      totalPrice += element.price;
    });
    return totalPrice;
  }
}

extension OrderItemH on OrderItem {
  double? calPrice(List<Product> products) {
    if (productId != 0 && quantity > 0) {
      return products.firstWhere((element) => element.id == productId).price * quantity;
    }
    return null;
  }
}
