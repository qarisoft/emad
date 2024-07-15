import 'dart:developer';

import 'package:emad/features/croot/ui/bloc/customer/customer_bloc.dart';
import 'package:emad/features/croot/ui/ex.dart';
import 'package:emad/features/croot/ui/widgets/resource/resource.dart';

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/resource/title_with_search.dart';

class CustomersPage extends StatelessWidget {
  const CustomersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.black,
        backgroundColor: const Color(0xffE5E5E5),
      ),
      body: BlocConsumer<CustomerBloc, CustomerState>(
        listener: (context, CustomerState state) {
          if (state case Data()) {
            log('sssssssssssssssss');
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(5.w),
            child: Column(
              children: [
                const ResourceTitle(title: 'Customers', createForm: CreateCustomerForm()),
                SizedBox(
                  height: 10.h,
                ),
                ElevatedButton(
                    onPressed: () {
                      context.read<CustomerBloc>().add(Started());
                    },
                    child: Text('test'))
                // Expanded(child: Container(
                //   // color: Colors.white,
                //   child: DataTableDemo(),
                //   // color: Colors.red,
                // ))
              ],
            ),
          );
        },
      ),
    );
  }
}

class CreateCustomerForm extends StatefulWidget {
  const CreateCustomerForm({super.key});

  @override
  CreateCustomerFormState createState() => CreateCustomerFormState();
}

class PersonData {
  String? name = '';
  String? phoneNumber = '';
  String? email = '';
  String password = '';

  @override
  String toString() {
    return 'PersonData{name: $name, phoneNumber: $phoneNumber, email: $email, password: $password}';
  }
}

class CreateCustomerFormState extends State<CreateCustomerForm> {
  PersonData person = PersonData();

  // late FocusNode _phoneNumber, _email, _lifeStory, _password, _retypePassword;

  // _create()

  // @override
  // void initState() {
  //   super.initState();
  //   // _phoneNumber = FocusNode();
  //   // _email = FocusNode();
  //   // _lifeStory = FocusNode();
  //   // _password = FocusNode();
  //   // _retypePassword = FocusNode();
  // }

  // @override
  // void dispose() {
  //   // _phoneNumber.dispose();
  //   // _email.dispose();
  //   // _lifeStory.dispose();
  //   // _password.dispose();
  //   // _retypePassword.dispose();
  //   super.dispose();
  // }

  void showInSnackBar(String value) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(value),
    ));
  }

  // @override
  // String get restorationId => 'text_field_demo';

  // @override
  // void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
  //   registerForRestoration(_autoValidateModeIndex, 'autovalidate_mode');
  // }

  // final RestorableInt _autoValidateModeIndex = RestorableInt(AutovalidateMode.disabled.index);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState<String>> _passwordFieldKey = GlobalKey<FormFieldState<String>>();
  final _UsNumberTextInputFormatter _phoneNumberFormatter = _UsNumberTextInputFormatter();

  void _handleSubmitted() {
    final form = _formKey.currentState!;
    if (!form.validate()) {
      // _autoValidateModeIndex.value = AutovalidateMode.always.index; // Start validating on every change.
      showInSnackBar(
        'error',
      );
      return;
    }
    wait(
      action: (c) async {
        await context.read<CustomerBloc>().create(person.name ?? '', person.phoneNumber ?? '');
      },
      context: context,
      next: ()=>Navigator.of(context).pop()
    );
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'this field is required';
    }
    final nameExp = RegExp(r'^[A-Za-z ]+$');
    if (!nameExp.hasMatch(value)) {
      return 'onlyAlphabeticalChars';
    }
    return null;
  }

  String? _validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'this field is required';
    }
    // final phoneExp = RegExp(r'^\(\d\d\d\) \d\d\d\-\d\d\d\d$');
    // if (!phoneExp.hasMatch(value!)) {
    //   return 'enter phone number';
    // }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    const sizedBoxSpace = SizedBox(height: 24);
    return Container(
      color: Colors.white,
      child: Form(
        key: _formKey,
        // autovalidateMode: AutovalidateMode.values[_autoValidateModeIndex.value],
        child: Scrollbar(
          child: SingleChildScrollView(
            restorationId: 'text_field_demo_scroll_view',
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                sizedBoxSpace,
                TextFormField(
                  restorationId: 'name_field',
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    filled: true,
                    icon: Icon(Icons.person),
                    // hintText: 'dsadec',
                    labelText: 'name',
                  ),
                  onChanged: (val) {
                    person.name = val;
                  },
                  // controller: ,
                  // onSaved: (value) {
                  //   person.name = value;
                  //   _phoneNumber.requestFocus();
                  // },
                  validator: _validateName,
                ),
                sizedBoxSpace,
                TextFormField(
                  restorationId: 'phone_number_field',
                  textInputAction: TextInputAction.next,
                  // focusNode: _phoneNumber,
                  decoration: const InputDecoration(
                    filled: true,
                    icon: Icon(Icons.phone),
                    hintText: 'phone number',
                    labelText: 'phone number',
                    prefixText: '+967',
                  ),
                  keyboardType: TextInputType.phone,
                  onChanged: (val) {
                    person.phoneNumber = val;
                  },
                  maxLength: 14,
                  maxLengthEnforcement: MaxLengthEnforcement.none,
                  validator: _validatePhoneNumber,
                  // TextInputFormatters are applied in sequence.
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    // Fit the validating format.
                    _phoneNumberFormatter,
                  ],
                ),
                sizedBoxSpace,
                Center(
                  child: ElevatedButton(
                    onPressed: _handleSubmitted,
                    child: const Text('save'),
                  ),
                ),
                sizedBoxSpace,
                Text(
                  'save new customer',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                sizedBoxSpace,
              ],
            ),
          ),
        ),
      ),
    );
    // },
    // );
  }
}

class _UsNumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final newTextLength = newValue.text.length;
    final newText = StringBuffer();
    var selectionIndex = newValue.selection.end;
    var usedSubstringIndex = 0;
    if (newTextLength >= 1) {
      newText.write('(');
      if (newValue.selection.end >= 1) selectionIndex++;
    }
    if (newTextLength >= 4) {
      newText.write('${newValue.text.substring(0, usedSubstringIndex = 3)}) ');
      if (newValue.selection.end >= 3) selectionIndex += 2;
    }
    if (newTextLength >= 7) {
      newText.write('${newValue.text.substring(3, usedSubstringIndex = 6)}-');
      if (newValue.selection.end >= 6) selectionIndex++;
    }
    if (newTextLength >= 11) {
      newText.write('${newValue.text.substring(6, usedSubstringIndex = 10)} ');
      if (newValue.selection.end >= 10) selectionIndex++;
    }
    // Dump the rest.
    if (newTextLength >= usedSubstringIndex) {
      newText.write(newValue.text.substring(usedSubstringIndex));
    }
    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
