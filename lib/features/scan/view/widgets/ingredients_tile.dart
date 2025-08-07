// lib/widgets/product_tile.dart

import 'dart:async';
import 'package:eaat/core/constants/color_palette.dart';
import 'package:eaat/core/constants/custom_spacers.dart';
import 'package:eaat/utils/locale/app_locale.dart';
import 'package:eaat/utils/themes/text_styles.dart';
import 'package:eaat/widgets/custom_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class IngredientTile extends StatefulWidget {
  final String title;
  final String imageUrl;
  final int initialQty;

  const IngredientTile({
    super.key,
    required this.title,
    required this.imageUrl,
    this.initialQty = 1,
  });

  @override
  State<IngredientTile> createState() => _IngredientTileState();
}

class _IngredientTileState extends State<IngredientTile> {
  final StreamController<int> _counterController =
      StreamController<int>.broadcast();
  late int _currentQty;

  @override
  void initState() {
    super.initState();
    _currentQty = widget.initialQty;
    _counterController.add(_currentQty);
  }

  void _increment() {
    _currentQty++;
    _counterController.add(_currentQty);
  }

  void _decrement() {
    if (_currentQty > 1) {
      _currentQty--;
      _counterController.add(_currentQty);
    }
  }

  @override
  void dispose() {
    _counterController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 77.h,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ColorPalette.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CustomNetworkImage(
            imageUrl: widget.imageUrl,
            width: 60,
            height: 60,
            borderRadius: BorderRadius.circular(12),
          ),
          CustomSpacers.width10,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title, style: TextStyles.const15.w500.black),
                StreamBuilder<int>(
                  stream: _counterController.stream,
                  builder: (context, snapshot) {
                    final qty = snapshot.data ?? widget.initialQty;
                    return Text(
                      "${AppLocale.textQty.tr}: $qty",
                      style: TextStyles.const13.w400.grey,
                    );
                  },
                ),
              ],
            ),
          ),
          CustomSpacers.width10,
          Row(
            children: [
              GestureDetector(
                onTap: _decrement,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: ColorPalette.scaffoldSecondaryBackground,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(Icons.remove),
                ),
              ),
              CustomSpacers.width8,
              StreamBuilder<int>(
                stream: _counterController.stream,
                builder: (context, snapshot) {
                  return Text(
                    '${snapshot.data ?? _currentQty}',
                    style: TextStyles.const15.w500.black,
                  );
                },
              ),
              CustomSpacers.width8,
              GestureDetector(
                onTap: _increment,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: ColorPalette.scaffoldSecondaryBackground,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(Icons.add),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
