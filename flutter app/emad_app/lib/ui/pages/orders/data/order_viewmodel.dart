import 'dart:async';
import 'dart:convert';

import 'package:emad_app/domain/models/models.dart';
import 'package:emad_app/ui/view_model/base.dart';

import '../../../../data/db.dart';
import '../../../../domain/models/product/_product_model.dart';

class OrderViewModel extends BaseViewModel<OrdersStateObj,Order>{
  List<Map<String,dynamic>> p=[];
  List<Map<String,dynamic>> c=[];
  Future<List<Map<String,dynamic>>> get _products  async{
    p = p.isNotEmpty?p: await SqlHelper.all(Product);
    return p;
  }
  Future<List<Map<String,dynamic>>> get _customers async{
    c= c.isNotEmpty? c:await SqlHelper.all(Customer);
    return c;
  }

  @override
  Future<OrdersStateObj> getData() async{
    final data      = await SqlHelper.all(Order);
    final products  = await _products;
    final customers = await _customers;
    final a =  OrdersStateObj(
      orders: data.map((e) => Order.fromDb(e)).toList(),
      customers: customers.map((e) => Customer.fromDb(e)).toList(),
      products: products.map((e) => Product.fromDb(e)).toList(),
    );
    print(a.customers);
    print(a.products);
    print(a.orders);
    return a;

  }


  @override
  add(List<Map<String, dynamic>> data) {
    // TODO: implement add
    throw UnimplementedError();
  }

}

class OrdersStateObj {
  OrdersStateObj({required this.orders, required this.customers, required this.products});

  final List<Order> orders;
  final List<Customer> customers;
  final List<Product> products;
}
