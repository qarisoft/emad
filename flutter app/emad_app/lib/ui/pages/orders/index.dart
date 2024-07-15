import 'package:emad_app/domain/models/product/_product_model.dart';
import 'package:emad_app/ui/_widgets/table.dart';
import 'package:emad_app/ui/pages/orders/data/order_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../_widgets/shared.dart';
import 'order_view.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key,  this.title='Orders'});
  final String title;

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final OrderViewModel _viewModel = OrderViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      // backgroundColor: const Color(0xffE5E5E5),

      body: SafeArea(
        child: StreamBuilder<OrdersStateObj>(
            stream: _viewModel.stream,
            builder: (context, snapshot) {
              final state = snapshot.data;

              return state!=null? Padding(
                padding: EdgeInsets.fromLTRB(24.w, 20.h, 24.w, 10.h),
                child: Column(
                        children: [
                          firstSection(state)
                        ],
                    ),
              ):const Center(child: CircularProgressIndicator(),);
            }),
      ),
    );
  }
  firstSection(OrdersStateObj state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
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
                onPressed: ()=> createOrder(state),

                icon: const Icon(
                  Icons.add_circle,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 10.h),
        const SearchForm(),
      ],
    );
  }

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

  editOrder(Order state) {}

  createOrder(OrdersStateObj stateObj) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ProductViewPage(
        customers: stateObj.customers,
        products: stateObj.products, operation: ModelPageState.create,

      );
    },));
    
  }
}
