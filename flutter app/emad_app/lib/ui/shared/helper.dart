import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Helper{
  static bool waiting = false;

  static wait(context) {
    if (waiting) {
      return;
    }
    waiting = true;
    return showDialog(
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
    ).whenComplete(() => waiting = false);
  }




}