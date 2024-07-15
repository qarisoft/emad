import 'package:emad_app/app/di.dart';
import 'package:emad_app/presentation/common/freezed_data_classes.dart';
import 'package:emad_app/presentation/main/pages/notifications/viewmodel.dart';
import 'package:emad_app/presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../data/data_source/db/models.dart';
import '../../../../data/data_source/db/sqlite.dart';
import '../../../common/state_renderer/state_renderer_impl.dart';




class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final ProductViewModel _viewModel = instance<ProductViewModel>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();


  @override
  void initState() {
     _viewModel.start();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          TextButton(
            onPressed: ()=>_showForm(),
            // onPressed: ()  {
            //    showDialog<void>(
            //       context: context,
            //       builder: (context) => AlertDialog(
            //         content: Stack(
            //           clipBehavior: Clip.none,
            //           children: <Widget>[
            //             Positioned(
            //               right: -40,
            //               top: -40,
            //               child: InkResponse(
            //                 onTap: () {
            //                   Navigator.of(context).pop();
            //                 },
            //                 child: const CircleAvatar(
            //                   backgroundColor: Colors.red,
            //                   child: Icon(Icons.close),
            //                 ),
            //               ),
            //             ),
            //             Form(
            //               key: _formKey,
            //               child: Column(
            //                 mainAxisSize: MainAxisSize.min,
            //                 children: <Widget>[
            //                   Padding(
            //                     padding: const EdgeInsets.all(8),
            //                     child: TextFormField(),
            //                   ),
            //                   Padding(
            //                     padding: const EdgeInsets.all(8),
            //                     child: TextFormField(),
            //                   ),
            //                   Padding(
            //                     padding: const EdgeInsets.all(8),
            //                     child: ElevatedButton(
            //                       child: const Text('Submitß'),
            //                       onPressed: () {
            //                         if (_formKey.currentState!.validate()) {
            //                           _formKey.currentState!.save();
            //                           log(_formKey.currentState.toString());
            //                         }
            //                       },
            //                     ),
            //                   )
            //                 ],
            //               ),
            //             ),
            //           ],
            //         ),
            //       ));
            // },
            // onPressed: () {
            //   // Navigator.of(context).restorablePush(_dialogBuilder);
            //
            // },
            child: const Text('create'),
          ),
          StreamBuilder<FlowState>(
              stream: _viewModel.outputState,
              builder: (context, snapshot) {
                return snapshot.data
                    ?.getScreenWidget(context, _getContentWidget(), () {
                  _viewModel.start();
                }) ??
                    _getContentWidget();
              }),
        ],
      )
    );
  }



  Widget _getContentWidget() {
    return StreamBuilder<ViewObject>(
        stream: _viewModel.outputData,
        builder: (context, snapshot) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _getMainSection(snapshot.data?.products)
            ],
          );
        });
  }
  Widget _getMainSection(List<Product>? products){
    if(products==null)return Container();
    return ListView(children: [
      for(final Product p in products)
        ListTile(
          title: Text(p.data.name),
        )
    ],);
  }
  Future<void> _addItem() async {
    Product a = Product(
      name: _nameController.text,
      price: double.parse(_priceController.text),
    );
    Db.addProduct(a);
  }
  void _showForm([int? id]) {
    showDialog(context: context, builder: (BuildContext context,) {
      return AlertDialog(
        content: Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            // Positioned(
            //   right: -40,
            //   top: -40,
            //   child: InkResponse(
            //     onTap: () {
            //       Navigator.of(context).pop();
            //     },
            //     child: const CircleAvatar(
            //       backgroundColor: Colors.red,
            //       child: Icon(Icons.close),
            //     ),
            //   ),
            // ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(hintText: 'Name'),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _priceController,
                  decoration: const InputDecoration(hintText: 'Price'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Save new journal
                    if (id == null) {
                      _addItem();
                    }

                    // if (id != null) {
                    //   await _updateItem(id);
                    // }

                    // Clear the text fields
                    _nameController.text = '';
                    _priceController.text = '';

                    // Close the bottom sheet
                    Navigator.of(context).pop();
                  },
                  child: Text(id == null ? 'Create New' : 'Update'),
                )
              ],
            )
          ],
        ),
      );
    });
  }
}
