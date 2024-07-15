import 'package:flutter/material.dart';

import '../../../domain/models/product/_product_model.dart';

class DropDownMenu extends StatefulWidget {
  const DropDownMenu({
    super.key,
    required this.data,
    required this.onSelected,
    required this.value,
    this.width,
    this.iconData=Icons.contact_mail_sharp,
  });

  final List<Customer> data;
  final Function(Customer? customer) onSelected;
  final Customer value;
  final double? width;
  final IconData iconData;

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  @override
  Widget build(BuildContext context) {
    return DropdownMenu<Customer>(
      leadingIcon:  Icon(widget.iconData),
      controller: TextEditingController(),
      width: widget.width,
      inputDecorationTheme: const InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(vertical: 1, horizontal: 10),
        border: OutlineInputBorder(borderSide: BorderSide.none),
      ),
      menuStyle: MenuStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          final s = {
            MaterialState.selected,
            MaterialState.focused,
          };
          // print(states);
          if (states.any(s.contains)) {
            return Colors.green;
          }
          return Colors.blueGrey.shade50;
        }),
      ),
      initialSelection: widget.value,
      onSelected: widget.onSelected,
      dropdownMenuEntries: widget.data.map<DropdownMenuEntry<Customer>>( (customer) {
        return DropdownMenuEntry<Customer>(value: customer, label: customer.name);
        // return DropdownMenuEntry<MapEntry<int,String>>(value: {mapE:data[mapE]?}, label: data[k] ?? '');
      }).toList(),
    );
  }
}

enum ColorLabel {
  blue('Blue', Colors.blue),
  pink('Pink', Colors.pink),
  green('Green', Colors.green),
  yellow('Orange', Colors.orange),
  grey('Grey', Colors.grey);

  const ColorLabel(this.label, this.color);

  final String label;
  final Color color;
}

// DropdownMenuEntry labels and values for the second dropdown menu.
enum IconLabel {
  smile('Smile', Icons.sentiment_satisfied_outlined),
  cloud(
    'Cloud',
    Icons.cloud_outlined,
  ),
  brush('Brush', Icons.brush_outlined),
  heart('Heart', Icons.favorite);

  const IconLabel(this.label, this.icon);

  final String label;
  final IconData icon;
}

class DropdownMenuExample extends StatefulWidget {
  const DropdownMenuExample({super.key});

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  final TextEditingController colorController = TextEditingController();
  final TextEditingController iconController = TextEditingController();
  ColorLabel? selectedColor;
  IconLabel? selectedIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DropdownMenu<ColorLabel>(
                initialSelection: ColorLabel.green,
                controller: colorController,
                requestFocusOnTap: true,
                label: const Text('Color'),
                onSelected: (ColorLabel? color) {
                  setState(() {
                    selectedColor = color;
                  });
                },
                dropdownMenuEntries: ColorLabel.values.map<DropdownMenuEntry<ColorLabel>>((ColorLabel color) {
                  return DropdownMenuEntry<ColorLabel>(
                    value: color,
                    label: color.label,
                    enabled: color.label != 'Grey',
                    style: MenuItemButton.styleFrom(
                      foregroundColor: color.color,
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(width: 24),
              // DropdownMenu<IconLabel>(
              //   controller: iconController,
              //   enableFilter: true,
              //   requestFocusOnTap: true,
              //   leadingIcon: const Icon(Icons.search),
              //   label: const Text('Icon'),
              //   inputDecorationTheme: const InputDecorationTheme(
              //     filled: true,
              //     contentPadding: EdgeInsets.symmetric(vertical: 5.0),
              //   ),
              //   onSelected: (IconLabel? icon) {
              //     setState(() {
              //       selectedIcon = icon;
              //     });
              //   },
              //   dropdownMenuEntries: IconLabel.values.map<DropdownMenuEntry<IconLabel>>(
              //         (IconLabel icon) {
              //       return DropdownMenuEntry<IconLabel>(
              //         value: icon,
              //         label: icon.label,
              //         leadingIcon: Icon(icon.icon),
              //       );
              //     },
              //   ).toList(),
              // ),
            ],
          ),
        ),
        if (selectedColor != null && selectedIcon != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('You selected a ${selectedColor?.label} ${selectedIcon?.label}'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Icon(
                  selectedIcon?.icon,
                  color: selectedColor?.color,
                ),
              )
            ],
          )
        else
          const Text('Please select a color and an icon.')
      ],
    );
  }
}
