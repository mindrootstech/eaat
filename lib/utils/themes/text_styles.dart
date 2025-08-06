import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static const TextStyle _base = TextStyle(
    fontFamily: 'Poppins',
    color: Colors.black,
  );

  // Sizes (example sizes, modify as required)
  static TextStyle const10 = _base.copyWith(fontSize: 10.sp);
  static TextStyle const12 = _base.copyWith(fontSize: 12.sp);
  static TextStyle const14 = _base.copyWith(fontSize: 14.sp);
  static TextStyle const15 = _base.copyWith(fontSize: 15.sp);
  static TextStyle const16 = _base.copyWith(fontSize: 16.sp);
  static TextStyle const18 = _base.copyWith(fontSize: 18.sp);
  static TextStyle const20 = _base.copyWith(fontSize: 20.sp);
  static TextStyle const24 = _base.copyWith(fontSize: 24.sp);
  static TextStyle const28 = _base.copyWith(fontSize: 28.sp);
  static TextStyle const32 = _base.copyWith(fontSize: 32.sp);
}

extension TextStyleExtension on TextStyle {
  TextStyle get w100 => copyWith(fontWeight: FontWeight.w100);
  TextStyle get w200 => copyWith(fontWeight: FontWeight.w200);
  TextStyle get w300 => copyWith(fontWeight: FontWeight.w300);
  TextStyle get w400 => copyWith(fontWeight: FontWeight.w400);
  TextStyle get w500 => copyWith(fontWeight: FontWeight.w500);
  TextStyle get w600 => copyWith(fontWeight: FontWeight.w600);
  TextStyle get w700 => copyWith(fontWeight: FontWeight.w700);
  TextStyle get w800 => copyWith(fontWeight: FontWeight.w800);
  TextStyle get w900 => copyWith(fontWeight: FontWeight.w900);

  TextStyle get black => copyWith(color: Colors.black);
  TextStyle get white => copyWith(color: Colors.white);
  TextStyle get red => copyWith(color: Colors.red);
  TextStyle get blue => copyWith(color: Colors.blue);
  TextStyle get green => copyWith(color: Colors.green);
  TextStyle get grey => copyWith(color: Colors.grey);
}
