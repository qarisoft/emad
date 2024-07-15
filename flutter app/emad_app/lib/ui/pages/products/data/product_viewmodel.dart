import 'dart:async';
import 'package:emad_app/domain/models/models.dart';
import 'package:emad_app/domain/responses/product.dart';
import 'package:emad_app/ui/view_model/base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';
import '../../../../data/db.dart';
import '../../../../domain/models/product/_product_model.dart';

class ProductViewModel extends BaseViewModel <ProductsStateObj,ProductResponse>{
  // final StreamController<ProductsStateObj> _stream = StreamController();

  // Stream<ProductsStateObj> get stream => _stream.stream;

  // fetch() async {
  //   final event = await getData();
  //   _stream.sink.add(event);
  // }

  // TODO implement use case
  @override
  Future<ProductsStateObj> getData() async {
    // final data = await SqlHelper.all(Product);
    final db = await SqlHelper.db();
    var response = await db.rawQuery('''
    select 
          p.id,
          p.name,
          p.price,
          p.created_at,
          p.updated_at,
          p.active,
	        sum(quantity * positive) available
       from products p
       join charges c on p.id=c.product_id
        	GROUP by product_id;
    ''');
    return ProductsStateObj(response.map((e) => ProductResponse.fromJson(e)).toList());
  }

  // @override
  // Future<int> delete(c) async {
  //   waite();
  //   final Product p = Product.fromJson(c.toJson());
  //   final res = await p.delete();
  //   if (res > 0) {
  //     fetch();
  //     send('Customer ${p.name} was deleted successfully');
  //   }
  //   if (res <= 0) {
  //     send('something wrong happend');
  //   }
  //   return res;
  // }

  // @override
  // Future<int> create(val) async {
  //   try {
  //
  //     print(val);
  //     TODO implement use case
      // val  as Product;
      // final product = Product(price: val.price,name: val.name,active: val.active);
      // final res = await product.save();
      // send('${val.nam} was created successfully');
      // await fetch();
      // return res;
    // } catch (e) {
    //   print('errrrrrror $e');
    //   return -1;
    // }
  // }

  // @override
  // dispose() {
  //   _stream.close();
  // }
  //
  // @override
  // init(c) async{
  //   context = c;
  //   await fetch();
  // }

  @override
  add(List<Map<String, dynamic>> data) {
    // TODO: implement add
    throw UnimplementedError();
  }
}

class ProductsStateObj {
  ProductsStateObj(this.data);

  final List<ProductResponse> data;
}
