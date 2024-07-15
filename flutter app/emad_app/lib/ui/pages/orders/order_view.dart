// import 'dart:convert';
// import 'dart:developer';

import 'package:emad_app/domain/models/product/_product_model.dart';
import 'package:emad_app/ui/_widgets/order.dart';
// import 'package:emad_app/ui/pages/orders/data/order_viewmodel.dart';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:input_quantity/input_quantity.dart';

// import 'dart:mirrors';
// import 'dart:';
import '../../../domain/models/models.dart';
import '../../_widgets/form/_add_product.dart';
// import '../../_widgets/form/_drob_down.dart';
import '../../_widgets/form/_check_box.dart';
import '../../_widgets/form/_text.dart';
import '../../_widgets/shared.dart';
// import '../../shared/colors.dart';
// import '../../shared/styles.dart';

final _decoration = BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10));

class ProductViewPage extends StatefulWidget {
  ProductViewPage({super.key, required this.products, required this.customers, required this.operation});

  final Order model = Order(createdAt: DateTime.now());
  final List<Product> products;
  final List<Customer> customers;
  final ModelPageState operation;

  @override
  State<ProductViewPage> createState() => _ProductViewPageState();
}

class _ProductViewPageState extends State<ProductViewPage> {
  Order get model => _model ?? widget.model;
  Order? _model;
  List<OrderItem> items = [];

  get customers => widget.customers;

  get products => widget.products;

  set model(Order order) => setState(() => model = order);
  final TextEditingController _customerIdController = TextEditingController();
  final TextEditingController _totalPriceController = TextEditingController();
  Customer? selectedCustomer;

  _addItem(OrderItem o) => setState(() => items.add(o));

  _saveItem(int index, OrderItem item) =>
      setState(() => items[index] = item.copyWith(price: item.calPrice(products) ?? item.price));

  @override
  Widget build(BuildContext context) {
    return ResourcePage(
      model: model,
      child: Form(
        child: Column(
          children: [_checkBoxesForm(), 5.verticalSpace, _orderForm(), 15.verticalSpace, _orderProductsForm()],
        ),
      ),
    );
  }

  Widget _checkBoxesForm() => Row(
        children: [
          Wrap(
            direction: Axis.horizontal,
            children: [
              Row(
                children: [
                  const Text('Is Posted'),
                  5.horizontalSpace,
                  CheckBoxAttribute(model.isPosted,
                      onChange: (a) => model = model.copyWith(isPosted: a ?? model.isPosted))
                ],
              ),
              Row(
                children: [
                  const Text("Is Deliverd "),
                  5.horizontalSpace,
                  CheckBoxAttribute(model.isDelivered,
                      onChange: (a) => model = model.copyWith(isDelivered: a ?? model.isDelivered))
                ],
              )
            ],
          ),
        ],
      );

  Widget _orderForm() => Table(
        columnWidths: const {
          0: FlexColumnWidth(0.4),
        },
        children: [
          TableRow(decoration: _decoration, children: [
            const TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Center(child: Text('Customer')),
            ),
            TableCell(
                child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: DropdownMenu<Customer>(
                leadingIcon: const Icon(Icons.contact_mail_sharp),
                controller: _customerIdController,
                width: 220.w,
                inputDecorationTheme: const InputDecorationTheme(
                  contentPadding: EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                ),
                // menuStyle: MenuStyle(
                //   backgroundColor: MaterialStateProperty.resolveWith((states) {
                //     final s = {
                //       MaterialState.selected,
                //       MaterialState.focused,
                //     };
                //     if (states.any(s.contains)) {
                //       return Colors.green;
                //     }
                //     return Colors.blueGrey.shade50;
                //   }),
                // ),
                initialSelection: selectedCustomer,
                onSelected: (Customer? c) {
                  model = model.copyWith(customerId: c?.id ?? model.customerId);
                },
                dropdownMenuEntries: customers.map<DropdownMenuEntry<Customer>>((customer) {
                  return DropdownMenuEntry<Customer>(value: customer, label: customer.name);
                }).toList(),
              ),
              // )),
            ))
          ]),
          const TableRow(children: [
            TableCell(child: SizedBox(height: 10)),
            TableCell(child: SizedBox(height: 10)),
          ]),
          TableRow(decoration: _decoration, children: [
            const TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Center(child: Text('Total Price')),
            ),
            TableCell(
                child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextAttribute(controller: _totalPriceController, str: false),
            )),
          ]),
        ],
      );

  Widget _orderProductsForm() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Products',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            IconButton(
                onPressed: widget.operation != ModelPageState.view ? () => _dialogBuilder(context) : null,
                icon: const Icon(Icons.add)),
          ],
        ),
        Table(
          border: TableBorder.all(color: Colors.black54),
          children: [
            const TableRow(children: [
              TableCell(child: Center(child: Padding(padding: EdgeInsets.all(5.0), child: Text('Product')))),
              TableCell(child: Center(child: Padding(padding: EdgeInsets.all(5.0), child: Text('quantity')))),
              TableCell(child: Center(child: Padding(padding: EdgeInsets.all(5.0), child: Text('price')))),
            ]),
            ..._data(),
            TableRow(children: [
              const TableCell(child: Center(child: TextCel('total'))),
              const TableCell(child: SizedBox()),
              TableCell(child: Center(child: TextCel(items.calPrice().toString()))),
            ]),

            // if (state['items']!=null)
          ],
        ),
      ],
    );
  }

  _data() {
    List<TableRow> w = [];
    items.asMap().forEach((int index, OrderItem o) {
      Product p = products.firstWhere((e) => e.id == o.productId);
      w.add(TableRow(children: [
        TableCell(
            child: Center(
          child: TextCel(p.name),
        )),
        TableCell(
          child: Center(
            child: InputQty(
              decoration: const QtyDecorationProps(
                  qtyStyle: QtyStyle.btnOnRight,
                  orientation: ButtonOrientation.horizontal,
                  border: OutlineInputBorder(borderSide: BorderSide.none)),
              maxVal: 100,
              initVal: o.quantity,
              minVal: 0,
              steps: 1,
              onQtyChanged: (val) => _saveItem(index, o.copyWith(quantity: val.round())),
            ),
          ),
        ),
        TableCell(child: Center(child: TextCel(o.price.toString()))),
      ]));
    });
    return w;
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.only(left: 0, right: 0),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(32.0))),
          content: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.w), color: Colors.white),
            height: 152.h,
            alignment: Alignment.center,
            padding: EdgeInsets.all(10.w),
            child: NewWidget(
              products: products,
              onSave: (OrderItem o) => _addItem(o),
            ),
          ),
        );
      },
    );
  }
}
