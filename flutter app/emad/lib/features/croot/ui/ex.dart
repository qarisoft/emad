import 'package:emad/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
BuildContext _context()=>MyApp.context;
// double? h()=>context()?.size?.height;
// double? width()=>context()?.size?.width;
extension Sc on num{
  double get w =>MediaQuery.of(_context()).size.width * 0.01 * this ;
  double get h =>MediaQuery.of(_context()).size.height * 0.01 ;
}


wait({required Future<void> Function(BuildContext c) action, Function()? next, required context}) async{
  // BuildContext? c;

   await showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      action(context).whenComplete((){
          Navigator.of(context).canPop()?Navigator.of(context).pop():null;
          next!=null?next():null;
        // if (val) {
        // }
      });
      return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white, ),

              height: 10.w,
              width: 10.w,
              child: const CircularProgressIndicator(),
            ),
          ],
        ),
      );
    },
  );
}