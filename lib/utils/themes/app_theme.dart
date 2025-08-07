import 'package:eaat/core/constants/color_palette.dart';
import 'package:eaat/core/constants/figma_constants.dart';
import 'package:eaat/utils/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  // light
  static ThemeData lightTheme = ThemeData(
    textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      titleSpacing: FigmaConstants.defaultPadding,
      backgroundColor: ColorPalette.scaffoldBackground,
      elevation: 0,
      titleTextStyle: TextStyles.const17.w600.black,
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.black),
    ),
    primaryColor: ColorPalette.primary,
    scaffoldBackgroundColor: ColorPalette.scaffoldBackground,
    colorScheme: const ColorScheme.light(
      primary: ColorPalette.primary,
      secondary: ColorPalette.secondary,
    ),
    elevatedButtonTheme: _elevatedButtonLightTheme,
    checkboxTheme: _checkBoxThemeLight,
  );

  static final _elevatedButtonLightTheme = ElevatedButtonThemeData(
    style: ButtonStyle(
      minimumSize: MaterialStatePropertyAll(const Size(double.maxFinite, 52)),
      backgroundColor: MaterialStatePropertyAll(ColorPalette.primary),
      foregroundColor: MaterialStatePropertyAll(Colors.white),
      elevation: MaterialStatePropertyAll(0),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(FigmaConstants.defaultRadius),
        ),
      ),
    ),
  );

  static final _checkBoxThemeLight = CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.selected)) {
        return ColorPalette.green;
      }
      return Colors.white;
    }),
    checkColor: WidgetStateProperty.all(Colors.white),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    // only static value here!
  );

  // dark
}
