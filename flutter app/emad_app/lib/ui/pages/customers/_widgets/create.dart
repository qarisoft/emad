import 'package:emad_app/domain/models/product/_product_model.dart';
import 'package:emad_app/ui/shared/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomerForm extends StatefulWidget {
  const CustomerForm({super.key, required this.save});

  final Function(BuildContext context,String text) save;

  @override
  State<CustomerForm> createState() => _CustomerFormState();
}

class _CustomerFormState extends State<CustomerForm> {
  final TextEditingController con = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.only(left: 0, right: 0),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(32.0))),
      content: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.w), color: Colors.white),
          height: 152.h,
          alignment: Alignment.center,
          padding: EdgeInsets.all(20.w),
          child: Column(
            children: [
              const Row(
                children: [
                  Text('Name'),
                ],
              ),
              10.verticalSpace,
              TextFormField(
                controller: con,
                onChanged: (s) => setState(() {}),
                validator: (value) {
                  if (value == null) {
                    return 'type some thing';
                  }
                  return null;
                },
              ),
              10.verticalSpace,
              Row(
                children: [
                  ElevatedButton(
                    onPressed: con.text.isNotEmpty
                        ? () => widget.save(context,con.text)
                        : null,
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(const RoundedRectangleBorder())),
                    child: const Text('save'),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
