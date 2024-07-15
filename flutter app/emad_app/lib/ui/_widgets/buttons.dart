import 'package:flutter/material.dart';


class Button extends StatelessWidget {
  const Button({super.key,  this.action,   required this.text, this.textColor = Colors.white,this.color=Colors.grey,});
  final Function()? action;
  final Color color;
  final Color textColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: action,
      style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))
              )),
          // backgroundColor: MaterialStateColor.resolveWith((states) =>color )
        // backgroundColor:

      ),
      child:  Text(
        text,
        style: TextStyle(color: textColor),
      ),
    );
  }
}

class CancelButton extends StatelessWidget {
  const CancelButton({super.key,  this.action,  this.color=Colors.grey});
  final Function()? action;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Button(action: action?? ()=> Navigator.pop(context), text: 'Cancel');
  }
}


class ConfirmButton extends StatelessWidget {
  const ConfirmButton({super.key, required this.action});
  final Function()? action;

  @override
  Widget build(BuildContext context) {

    return Button(action: action, text: 'Confirm',color: Colors.blue);
  }
}
