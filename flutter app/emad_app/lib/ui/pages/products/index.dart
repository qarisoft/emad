import 'package:emad_app/domain/models/models.dart';
import 'package:emad_app/domain/models/product/_product_model.dart';
import 'package:emad_app/domain/responses/product.dart';
import 'package:emad_app/ui/_widgets/shared.dart';
import 'package:emad_app/ui/pages/products/_widgets/create.dart';
import 'package:emad_app/ui/pages/products/data/product_viewmodel.dart';
import 'package:emad_app/ui/shared/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';

import '../../_widgets/table.dart';
class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key, this.title = 'Products'});

  final String title;

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final ProductViewModel _viewModel = ProductViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,

      // backgroundColor: const Color(0xffE5E5E5),

      body: SafeArea(
        child: StreamBuilder<ProductsStateObj>(
            stream: _viewModel.stream,
            builder: (context, snapshot) {
              final state = snapshot.data?.data ?? [];
              return Padding(
                padding: EdgeInsets.fromLTRB(24.w, 20.h, 24.w, 10.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    firstSection(),
                    20.verticalSpace,
                    TableWidget2(
                      titles: const ['Name', 'Price RY','available'],
                      data: [
                        ...List.generate(
                            state.length,
                            (index) => [
                                  InkWell(onTap: ()=>editProduct(state[index].toDomain())
                                  , child: Center(child: Text(state[index].name,style: const TextStyle(color: Colors.blue),))),
                                  Center(child: Text(state[index].price.toString())),
                                  Center(child: Text(state[index].available.toString())),
                                ])
                      ],
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }

  firstSection() {
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
                onPressed: ()=> createProduct(),

                // onPressed: () =>,
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

  createProduct() {
    return showDialog(
      barrierDismissible: false,
          context: context,
          builder: (context) {
            return ProductForm(save: (c, name, price) {
              Navigator.of(c).pop();
              Helper.wait(c);
              final close = Navigator.of(c).pop;
              _viewModel.create(Product(name: name, price: double.parse(price))).then((value) {
                close();
              });
            });
          },
        );
  }
  editProduct(Product product) {
    return showDialog(
      // barrierDismissible: false,
      context: context,
      builder: (context) {
        return ProductForm(
            product:product ,
            onDelete: (){
              Navigator.of(context).pop();
              final close = Navigator.of(context).pop;
              _viewModel.delete(product,product.name).then((value) {
                close();
              });

            },
            save: (c, name, price) {

          Navigator.of(c).pop();
          final close = Navigator.of(c).pop;
          _viewModel.create(Product(name: name, price: double.parse(price))).then((value) {
            close();
          });
        });
      },
    );
  }

  @override
  void initState() {
    // final p = Product(name: 'ddd',price: 2323);
    // p.save().then((value){
    //   print('ddddddddddddddddddd');
    // });

    _viewModel.init(context);
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
