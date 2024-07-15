import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/colors.dart';

class TextAttribute extends StatelessWidget {
  const TextAttribute({super.key, required this.controller, this.str = true, this.inputFormatters, this.autofocus=false});

  final bool str;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'type some thing';
        }
        return null;
      },
      inputFormatters:inputFormatters,
      controller: controller,
      autofocus: autofocus,

      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),

      decoration: InputDecoration(
        border: OutlineInputBorder(

          borderRadius: BorderRadius.circular(4),
          // borderSide: BorderSide(color: Colors.blue),

        ),

        contentPadding: const EdgeInsets.symmetric(vertical: 1, horizontal: 10),
        // focusedBorder: const OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.blue),
        // ),
      ),
      keyboardType: str?TextInputType.text:TextInputType.number,

    );
  }
}
