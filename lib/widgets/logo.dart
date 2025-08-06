import 'package:eaat/core/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Logo extends StatelessWidget {
  final double? height, width;
  final Color? color;
  const Logo({super.key, this.height = 40, this.width = 164, this.color});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppAssets.svgIcons.logo,
      height: height,
      width: width,
      colorFilter: ColorFilter.mode(color ?? Colors.white, BlendMode.srcIn),
    );
  }
}
