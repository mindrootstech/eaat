import 'package:eaat/core/constants/color_palette.dart';
import 'package:eaat/core/constants/figma_constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final double? height, width;
  final Color? color;

  const CustomButton({
    super.key,
    required this.label,
    required this.onTap,
    this.height,
    this.width,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? ColorPalette.primary,
        minimumSize: Size(
          width ?? double.infinity,
          height ?? FigmaConstants.defaultButtonHeight,
        ),
        maximumSize: Size(
          width ?? double.infinity,
          height ?? FigmaConstants.defaultButtonHeight,
        ),
        // padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: FittedBox(fit: BoxFit.fill, child: Text(label)),
    );
  }
}
