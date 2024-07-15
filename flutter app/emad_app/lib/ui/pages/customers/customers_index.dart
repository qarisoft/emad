import 'package:emad_app/domain/models/product/_product_model.dart';
// import 'package:emad_app/ui/_widgets/buttons.dart';
import 'package:emad_app/ui/pages/customers/data/customers_viewmodel.dart';
import 'package:emad_app/ui/shared/colors.dart';
import 'package:emad_app/ui/shared/styles.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';
// import 'package:toastification/toastification.dart';

import '../../shared/helper.dart';
import '_widgets/create.dart';
import '_widgets/customer_widget.dart';

class CustomersPage extends StatefulWidget {
  const CustomersPage({super.key});

  @override
  State<CustomersPage> createState() => _CustomersPageState();
}

class _CustomersPageState extends State<CustomersPage> {
  final CustomersViewModel _viewModel = CustomersViewModel();

  @override
  void initState() {
    _viewModel.init(context);
    super.initState();
  }
  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      // backgroundColor: const Color(0xffE5E5E5),

      body: SafeArea(

        child: StreamBuilder<CustomerStateObj>(
          stream: _viewModel.stream,
          builder: (context, snapshot) {
            final state = snapshot.data?.data ?? [];
            return Padding(
              // padding: const EdgeInsets.all(8.0),
              padding: EdgeInsets.fromLTRB(24.w, 24.h, 24.w, 29.h),
              child: Column(
                children: [
                  firstWidget(),
                  20.verticalSpace,
                  secondWidget(state),

                  // secondWidget(),
                ],
              ),
            );
          }
        ),
      ),
    );
  }

  secondWidget(state){
    return Expanded(
        child: ListView.separated(
          itemCount: state.length,
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          itemBuilder: (con, i) {
            return CustomerWidget(customer: state[i],
                deleteAction: (customer,context){
                  Navigator.of(context).pop();
                  final a = Navigator.of(context).pop;
                  _viewModel.deleteCustomer(customer).then((value) {
                    a();
                  });
                }
            );
          },
          separatorBuilder: (c, i) {
            return SizedBox(height: 1.h);
          },
        )


    );
  }

  firstWidget(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        title(),
        SizedBox(height: 22.h),
        search(),
      ],
    );
  }
  
  
  createCustomer() {
    return CustomerForm(
      save: (BuildContext c,text) {
        Navigator.of(c).pop();
        Helper.wait(c);
        final close = Navigator.of(c).pop;
        _viewModel.create(Customer(name: text)).then((value) {
          close();
        });
      },
    );
  }

  title() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Customers",
          style: GoogleFonts.workSans(
            textStyle: TextStyle(
              fontSize: 24.sp,
              color: Colors.black,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          width: 24.r,
          height: 24.r,
          child: IconButton(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            padding: EdgeInsets.zero,
            onPressed: () => showDialog(
              context: context,
              builder: (context) {
                return createCustomer();
              },
            ),
            icon: const Icon(
              Icons.add_circle,
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }

  search() {
    return TextFormField(
      readOnly: true,
      //false
      autofocus: false,
      // style: ,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: const Icon(Icons.search, color: Colors.black),
        ),
        prefixIconConstraints: BoxConstraints(maxHeight: 20.w, maxWidth: 35.w),
        hintText: "Contacts",
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
