import 'dart:async';
import 'dart:developer';
import 'package:emad_app/presentation/common/freezed_data_classes.dart';
// import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqflite.dart';

import 'models.dart';
// import 'package:sqlite3/sqlite3.dart';

class Db {


  static late Database database;

  static Future<void> createTables(Database db,[int? version]) async {
    await db.execute('''
    CREATE TABLE products(
            id INTEGER PRIMARY KEY  NOT NULL, 
            name TEXT NOT NULL,
            created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
		        updated_at TIMESTAMP default NULL,
			      price FLOAT NOT NULL DEFAULT 0);
        CREATE TABLE customers(
                  id int PRIMARY KEY  NOT NULL,
                  name TEXT NOT NULL ,
                  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                  updated_at TIMESTAMP  DEFAULT null on update CURRENT_TIMESTAMP
                  );
      CREATE TABLE orders(
                id INTEGER   NOT NULL,
                customer_id int  not null,
                is_posted BOOL DEFAULT false,
                is_delivered BOOL DEFAULT false,
                created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                updated_at TIMESTAMP  DEFAULT null on update CURRENT_TIMESTAMP,
                PRIMARY KEY (id),
                key customer_id(customer_id),
                CONSTRAINT customer_id FOREIGN KEY (customer_id) REFERENCES customers (id)
                );
      CREATE TABLE order_product(
                id INT  NOT NULL,
                product_id int not null,
                order_id int not null,
                quantity INTEGER DEFAULT 1 NOT NULL ,
                price FLOAT DEFAULT 0 NOT NULL ,
                PRIMARY KEY (id),
                CONSTRAINT product_id FOREIGN KEY (product_id) REFERENCES products(id),
                CONSTRAINT order_id FOREIGN KEY (order_id) REFERENCES orders (id)
                );
    ''');
  }
  


  static init ()async{
    // String p = await getDatabasesPath();
    database = await openDatabase('data.2.db',onCreate: createTables,singleInstance: true,version: 1);
  }
  static Future<int> addProduct(Product p)async{
    return await database.insert(p.table, p.getData());
    
  }
}
