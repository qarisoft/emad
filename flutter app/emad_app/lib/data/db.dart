import 'package:sqflite/sqflite.dart';

class SqlHelper {
  static Future<void> createTables(Database db, [int? version]) async {

    await db.execute('''
    CREATE TABLE products(
            id INTEGER ,
            name TEXT NOT NULL,
            price REAL default 0,
            active INTEGER default 0,
            created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
		        updated_at TIMESTAMP,
		        PRIMARY KEY("id" AUTOINCREMENT)
			      );
    ''');

    await db.execute('''
    CREATE TABLE charges(
            "id" INTEGER,
            type TEXT NOT NULL default 'in',
            quantity INTEGER default 1,
            positive INTEGER default 1,
            product_id INTEGER not null,
            created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
		        updated_at TIMESTAMP,
            constraint fk_charges_product_id foreign key (product_id) 
      		    references products ("id"),
		        constraint pk_charges PRIMARY KEY("id" AUTOINCREMENT)
		        
			      );
    ''');


    await db.execute('''
        CREATE TABLE customers(
                  id INTEGER PRIMARY KEY  NOT NULL,
                  name TEXT,
                  active INTEGER default 0,
                  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                  updated_at TIMESTAMP
            );
    ''');

    await db.execute('''
        CREATE TABLE orderitems(
                  id INTEGER PRIMARY KEY  NOT NULL,
                  quantity INTEGER default 1,
                  product_id INTEGER not null,
                  order_id INTEGER not null,
                  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                  updated_at TIMESTAMP
            );
    ''');

    await db.execute('''
        CREATE TABLE orders(
                  id INTEGER PRIMARY KEY  NOT NULL,
                  year INTEGER default 2024,
                  total_price INTEGER default 0,
                  customer_id INTEGER default 0,
                  is_posted INTEGER default 0,
                  is_delivered INTEGER default 0,
                  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                  updated_at TIMESTAMP
            );
    ''');

  }

  static Future<Database> db() async {
    return await openDatabase(
      'data.33.db',
      onCreate: createTables,
      singleInstance: true,
      version: 1,
    );
  }

  static Future<List<Map<String, Object?>>> all(Type t)async{
    final db = await SqlHelper.db();
    return  await db.query(t.name);


  }
}

extension ModelHelper on Type{
  String get name=>'${toString().toLowerCase()}s';
  all() async{
    final db = await SqlHelper.db();
    return  await db.query(name);

  }
}
