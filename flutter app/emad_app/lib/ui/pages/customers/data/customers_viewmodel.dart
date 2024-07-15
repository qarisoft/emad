import 'dart:async';
import 'package:emad_app/domain/models/models.dart';
import 'package:emad_app/ui/view_model/base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';
import '../../../../data/db.dart';
import '../../../../domain/models/product/_product_model.dart';

class CustomersViewModel extends BaseViewModel<CustomerStateObj,Customer>{

  Future<int> deleteCustomer(Customer c) async{
    return await delete(c,c.nam);
  }

  // @override
  // Future<int> delete(c) async{
  //   waite();
  //   Customer c0 = Customer.fromJson(c.toJson());
  //   final res = await c.delete();
  //   if (res>0) {
  //     fetch();
  //     send('${c0.nam} ${c0.name} was deleted successfully');
  //   }
  //   if (res<=0) {
  //     send('something wrong happened');
  //   }
  //   return res;
  // }



  @override
  CustomerStateObj add(List<Map<String, dynamic>> data) {
    return CustomerStateObj( data.map((e) => Customer.fromDb(e)).toList());
  }
}


class CustomerStateObj{
  CustomerStateObj(this.data);
  final   List<Customer> data;
}