import 'package:emad_app/domain/models/models.dart';

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../shared/colors.dart';
import '../shared/styles.dart';

// import '../../_widgets/order.dart';
Color fillColor = Colors.grey.withAlpha(50);

enum ModelPageState { create, view, edit }

class SearchForm extends StatefulWidget {
  const SearchForm({
    super.key,
     this.readOnly =true,
     this.autofocus=false,
     this.hintLabel='search ...',
  });

  final bool   readOnly;
  final bool   autofocus;
  final String hintLabel;

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly,
      autofocus:widget.autofocus,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: const Icon(Icons.search, color: Colors.black),
        ),
        prefixIconConstraints: BoxConstraints(maxHeight: 20.w, maxWidth: 35.w),
        hintText: widget.hintLabel,
        // hintStyle: textFieldPlaceholderTextStyle(context),
        isDense: true,
        filled: true,
        fillColor: ColorName.grayC4,
        focusedBorder: AppStyles.focusedTransparentBorder,
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

class ResourcePage extends StatelessWidget {
  const ResourcePage({super.key, required this.model, required this.child});

  final Model model;
  final Widget child;

  Widget _titleWidget() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            model.nam,
            style: GoogleFonts.workSans(
              textStyle: TextStyle(
                fontSize: 24.sp,
                color: Colors.black,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          color: fillColor,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(24.w, 20.h, 24.w, 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [_titleWidget(), SizedBox(height: 10.h), child],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
