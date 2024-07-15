import 'dart:async';
import 'package:emad_app/domain/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';

import '../../data/db.dart';

abstract class BaseViewModel<T,M>{
  final StreamController<T> _stream = StreamController();
  Stream<T> get stream =>_stream.stream;
  StreamController<T> get streamController =>_stream;

  late final BuildContext context;

  Future<T> getData()async{

    final data =  await SqlHelper.all(M);
    return add(data);
  }

  data() async{
  }

  dispose() {
    streamController.close();
  }

  init(c) {
    context=c;
    fetch();
  }


  fetch() async{
    final event = await getData();
    _stream.sink.add(event);
  }

  T add(List<Map<String,dynamic>>data);

  send(String msg){
    toastification.show(
      context: context,
      title: Text(msg),
      autoCloseDuration: const Duration(seconds: 2),
    );
  }

  Future<int> create( Model model) async {
    try{
      final res = await model.save();
      send('${model.nam} was created successfully');
      fetch();
      return res;
    }catch (e){
      return -1;
    }
  }


  waite(){
    showDialog(
      context: context,
      builder: (context) {
        return Container(
          height: 100,
          width: 100,
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.4, vertical: MediaQuery.of(context).size.height * 0.45),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: EdgeInsets.all(10.r),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
                  child: const CircularProgressIndicator()),
            ],
          ),
        );
      },
    );
  }

  // Future<int> delete(Model c) ;
  // @override
  Future<int> delete(Model model,String? name ) async{
    waite();
    // Customer c0 = Customer.fromJson(c.toJson());
    final res = await model.delete();
    if (res>0) {
      fetch();
      send('${model.nam} $name was deleted successfully');
    }
    if (res<=0) {
      send('something wrong happened');
    }
    return res;
  }
}