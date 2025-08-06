import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FigmaConstants {
  // Default paddings
  static double defaultPadding = 25.0.w;
  static double defaultButtonHeight = 50.0.h;
  static const EdgeInsets defaultScreenPadding = EdgeInsets.symmetric(
    horizontal: 25.0,
    vertical: 12.0,
  );

  // Default border radius
  static const double defaultRadius = 12.0;
  static const BorderRadius defaultBorderRadius = BorderRadius.all(
    Radius.circular(defaultRadius),
  );

  // Screen dimensions (should be accessed in build context)
  static double screenHeight = 734;
  static double screenWidth = 375;
}
