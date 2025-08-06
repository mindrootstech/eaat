import 'package:eaat/core/constants/color_palette.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  final bool? value;
  final Function(bool)? onChanged;
  const CustomCheckBox({super.key, this.value, this.onChanged});

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool isSelected = false;

  @override
  void initState() {
    isSelected = widget.value ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isSelected,
      side: BorderSide(
        color: isSelected
            ? ColorPalette.green
            : ColorPalette.grey.withOpacity(.3),
        width: 1.0,
      ),
      onChanged: (value) {
        setState(() {
          isSelected = value ?? false;
        });
        widget.onChanged?.call(value ?? false);
      },
    );
  }
}
