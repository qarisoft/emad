import 'package:emad/core/theme/theme.dart';
import 'package:flutter/material.dart';


class SearchResource extends StatelessWidget {
  const SearchResource({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // readOnly: true,
      //false
      autofocus: false,
      // style: ,
      // decoration: InputDecoration(),
      decoration: InputDecoration(
        // border: InputBorder.none,
        contentPadding: const EdgeInsets.all(10),

        // prefixIcon: Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 8),
        //   child: const Icon(Icons.search, color: Colors.black),
        // ),
        // prefixIconConstraints: BoxConstraints(maxHeight: 20, maxWidth: 35),
        hintText: 'search ${title.toLowerCase()} ...',
        // hintStyle: textFieldPlaceholderTextStyle(context),
        // isDense: true,
        filled: true,
        // fillColor: ColorName.grayC4,
        focusedBorder: AppStyles.focusedBorder,
        disabledBorder: AppStyles.focusedTransparentBorder,
        enabledBorder: AppStyles.focusedTransparentBorder,
        errorBorder: AppStyles.focusedTransparentBorder,
        focusedErrorBorder: AppStyles.focusedTransparentBorder,
        errorStyle: errorTextStyle(context),
      ),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      onSaved: (val) {},
      onEditingComplete: () {},
      onChanged: (val) {},
      // validator: (val) {},
      onTap: () {},
    );
  }
}
