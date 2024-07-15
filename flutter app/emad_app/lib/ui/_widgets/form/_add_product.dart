import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:input_quantity/input_quantity.dart';

import '../../../domain/models/product/_product_model.dart';

class NewWidget extends StatefulWidget {
  const NewWidget({
    super.key,
    required this.products,
    required this.onSave,
  });

  final List<Product> products;
  final Function(OrderItem o) onSave;

  @override
  State<NewWidget> createState() => _NewWidgetState();
}

class _NewWidgetState extends State<NewWidget> {
  OrderItem state = const OrderItem();
  Product? product;
  TextEditingController productController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  save() {
    widget.onSave(state);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        20.verticalSpace,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text('Product'),
                ),
                DropdownMenu<Product>(
                  leadingIcon: const Icon(Icons.contact_mail_sharp),
                  controller: productController,
                  inputDecorationTheme: const InputDecorationTheme(
                    contentPadding: EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                  // menuStyle: MenuStyle(
                  //   backgroundColor: WidgetStateProperty.resolveWith((states) {
                  //     final s = {
                  //       WidgetState.selected,
                  //       WidgetState.focused,
                  //     };
                  //     if (states.any(s.contains)) {
                  //       return Colors.green;
                  //     }
                  //     return Colors.blueGrey.shade50;
                  //   }),
                  // ),
                  initialSelection: product,
                  onSelected: (Product? p) {
                    setState(() => product = p!);
                    state = p != null ? state.copyWith(productId: p.id!) : state;
                    updatePrice();
                  },
                  dropdownMenuEntries: widget.products.map<DropdownMenuEntry<Product>>((p) {
                    return DropdownMenuEntry<Product>(value: p, label: p.name);
                  }).toList(),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1),
                  child: Text('Quantity'),
                ),
                5.verticalSpace,
                InputQty(
                  decoration: const QtyDecorationProps(
                      qtyStyle: QtyStyle.btnOnRight,
                      orientation: ButtonOrientation.vertical,
                      border: OutlineInputBorder(borderSide: BorderSide.none)),
                  maxVal: 100,
                  initVal: 1,
                  minVal: 0,
                  steps: 1,
                  onQtyChanged: (val) {
                    state = state.copyWith(quantity: val.round());

                    if (state.productId!=0) {
                      updatePrice();

                    }
                  },
                ),


              ],
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
                onPressed: product != null ? () => save() : null,
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(const RoundedRectangleBorder())),
                child: const Text('save')),
            Row(children: [
            Text('price'),
            10.horizontalSpace,
            Text(state.price.toString()),
            20.horizontalSpace
            ],)
          ],
        )
      ],
    );
  }

  updatePrice(){
    final price = widget.products.firstWhere((el) =>el.id==state.productId ).price*state.quantity;

    setState(() {

    state = state.copyWith(
        price: price
    );
    });
  }
}
