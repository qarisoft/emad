import 'package:flutter/material.dart';

class CheckBoxAttribute extends StatelessWidget {
  const CheckBoxAttribute(this.attr, {super.key, required this.onChange});

  final Function(bool? value) onChange;
  final bool attr;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: attr,
      onChanged: onChange,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2.0),
      ),
      side: MaterialStateBorderSide.resolveWith(
            (states) => const BorderSide(width: 1.0, color: Colors.transparent),
      ),
    );
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.selected,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.grey.withAlpha(100);
  }
}

