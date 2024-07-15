import 'package:emad_app/domain/models/models.dart';
import 'package:emad_app/ui/_widgets/shared.dart';
// import 'package:flutter/cupertino.dart';

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:input_quantity/input_quantity.dart';

import '../../domain/models/product/_product_model.dart';
import 'form/_add_product.dart';
import 'form/_check_box.dart';
import 'form/_drob_down.dart';
import 'form/_text.dart';

class TextCel extends StatelessWidget {
  const TextCel(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 3),
      child: Text(text),
    );
  }
}

class OrderPage extends StatefulWidget {
  const OrderPage({super.key, required this.model, required this.operation});

  final Order model;
  final ModelPageState operation;

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {

  Order? _state;

  Order get state => _state ?? widget.model;

  set state(Order s) {
    setState(() {
      _state = s;
    });
  }

  Map<String, dynamic> controllers = {};

  Order get model => widget.model;

  List<Product> products = [
    const Product(id: 1, name: '100 RYS', price: 100),
    const Product(id: 2, name: '300 RYS', price: 300),
    const Product(id: 3, name: '400 RYS', price: 400),
  ];

  List<OrderItem> items = [];

  get title => widget.model.nam;

  _add(Order o) {
    try {
      state = o;
    } catch (e) {}
  }

  final List<Customer> customers = [
    const Customer(id: 1, name: 'c1'),
    const Customer(id: 2, name: 'c2'),
    const Customer(id: 3, name: 'c3'),
    const Customer(id: 4, name: 'c4'),
  ];
  Customer? selectedCustomer;
  final _decoration = BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10));

  @override
  void initState() {
    state = model;
    controllers['total_price'] = TextEditingController();
    controllers['customer_id'] = TextEditingController();
    // controllers['customer_id'] = widget.model.customerId;

    controllers['is_posted'] = widget.model.isPosted;
    controllers['is_delivered'] = widget.model.isDelivered;

    if (widget.operation != ModelPageState.create) {
      controllers['total_price'].text = widget.model.totalPrice.toString();
    }

    super.initState();
  }

  _saveItem(int index, OrderItem item) {
    setState(() {
      items[index] = item.copyWith(price: item.calPrice(products) ?? item.price);
    });
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
                  CheckBoxAttribute(state.isPosted,
                      onChange: (a) => _add(state.copyWith(isPosted: a ?? state.isPosted)))
                ],
              ),
              Row(
                children: [
                  const Text("Is Deliverd "),
                  5.horizontalSpace,
                  CheckBoxAttribute(state.isDelivered, onChange: (a) => _add(state.copyWith(isDelivered: a!)))
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
                controller: controllers['customer_id'],
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
                //     // print(states);
                //     if (states.any(s.contains)) {
                //       return Colors.green;
                //     }
                //     return Colors.blueGrey.shade50;
                //   }),
                // ),
                initialSelection: selectedCustomer,
                onSelected: (Customer? c) {
                  state = state.copyWith(customerId: c?.id ?? state.customerId);
                },
                dropdownMenuEntries: customers.map<DropdownMenuEntry<Customer>>((customer) {
                  return DropdownMenuEntry<Customer>(value: customer, label: customer.name);
                  // return DropdownMenuEntry<MapEntry<int,String>>(value: {mapE:data[mapE]?}, label: data[k] ?? '');
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
            TableCell(child: _field(controllers['total_price'], false)),
          ]),
        ],
      );

  Widget _orderProductsForm() {
    if (state.id != null) {
      return state.id! > 0
          ? Column(
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
                      TableCell(
                          child: Center(
                              child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text('Product'),
                      ))),
                      TableCell(
                          child: Center(
                              child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text('quantity'),
                      ))),
                      TableCell(
                          child: Center(
                              child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text('price'),
                      ))),
                    ]),
                    ..._data(),
                    TableRow(children: [
                      const TableCell(child: Center(child: TextCel('total'))),
                      const TableCell(child: SizedBox()),
                      TableCell(child: Center(child: TextCel(items.calPrice().toString()))),
                    ])

                    // if (state['items']!=null)
                  ],
                ),
              ],
            )
          : const SizedBox();
    }
    return Row(
      children: [
        ElevatedButton(
          onPressed: state.customerId>0?()=>{}:null,
          style: ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(const RoundedRectangleBorder())),
          child: const Text('save'),
        )
      ],
    );
  }

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

  _data() {
    List<TableRow> _w = [];
    items.asMap().forEach((int index, OrderItem o) {
      Product p = products.firstWhere((e) => e.id == o.productId);
      _w.add(TableRow(children: [
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
    return _w;
  }

  Widget _field(TextEditingController con, [bool str = true]) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: TextAttribute(
          controller: con,
          str: str,
        ));
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
              onSave: (OrderItem o) => setState(() => items.add(o)),
            ),
          ),
        );
      },
    );
  }
}
