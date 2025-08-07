import 'package:eaat/core/constants/color_palette.dart';
import 'package:eaat/utils/themes/text_styles.dart';
import 'package:flutter/material.dart';

class CustomCheckBoxTile extends StatefulWidget {
  final String title;
  final bool? isSelected;
  final BoxDecoration? boxDecoration;
  final Function(bool?)? onChanged;

  const CustomCheckBoxTile({
    super.key,
    required this.title,
    this.isSelected,
    this.boxDecoration,
    this.onChanged,
  });

  @override
  State<CustomCheckBoxTile> createState() => _CustomCheckBoxTileState();
}

class _CustomCheckBoxTileState extends State<CustomCheckBoxTile> {
  bool isSelected = false;
  @override
  void initState() {
    isSelected = widget.isSelected ?? false;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CustomCheckBoxTile oldWidget) {
    isSelected = widget.isSelected ?? false;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => setState(() {
        isSelected = !isSelected;
        widget.onChanged?.call(isSelected);
      }),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: ColorPalette.white,
        ),
        child: Row(
          children: [
            Text(widget.title, style: TextStyles.const15.w400.black),
            const Spacer(),
            Checkbox(
              value: isSelected,
              side: BorderSide(
                color: isSelected
                    ? ColorPalette.green
                    : ColorPalette.grey.withOpacity(.3),
                width: 1.0,
              ),
              onChanged: (value) {
                widget.onChanged?.call(value ?? false);
                setState(() {
                  isSelected = value ?? false;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
