import 'package:emad_app/domain/models/product/_product_model.dart';
import 'package:emad_app/ui/_widgets/buttons.dart';
import 'package:emad_app/ui/_widgets/form/_text.dart';
import 'package:emad_app/ui/shared/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductForm extends StatefulWidget {
  const ProductForm({super.key, required this.save, this.product, this.onDelete});

  final Function(BuildContext context, String name, String price) save;
  final Product? product;
  final Function()? onDelete;


  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (widget.product!=null ) {
      nameController.text=widget.product!.name;
      priceController.text=widget.product!.price.toString();
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.only(left: 0, right: 0),
      content: Form(
        key: _formKey,
        child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r), color: Colors.white),
            height: 230.h,
            alignment: Alignment.center,
            padding: EdgeInsets.all(20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Name'),
                    widget.product!=null
                        ? IconButton(onPressed: widget.onDelete, icon: const Icon(Icons.delete_forever,color: Colors.red,))
                        : const SizedBox()
                  ],
                ),
                TextAttribute(
                  controller: nameController,
                  autofocus:true
                ),
                const Spacer(),
                const Row(
                  children: [
                    Text('Price'),
                  ],
                ),
                TextAttribute(
                  controller: priceController,
                  str: false,
                ),
                // 10.verticalSpace,
                const Spacer(),
                Row(
                  children: [
                    ConfirmButton(
                      action: () {
                        if (_formKey.currentState!.validate()) {
                              widget.save(context, nameController.text, priceController.text);
                        }
                      },

                    ),
                    const Spacer(),
                    const CancelButton(),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
