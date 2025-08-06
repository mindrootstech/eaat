import 'package:eaat/core/constants/custom_spacers.dart';
import 'package:eaat/core/constants/figma_constants.dart';
import 'package:eaat/utils/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/extensions/export.dart';

class CommonPageViewParms {
  final String title;
  final String description;
  final String imagePath;
  CommonPageViewParms({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}

class CommmonPageViewPage extends StatelessWidget {
  final CommonPageViewParms parms;
  const CommmonPageViewPage({super.key, required this.parms});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.all(FigmaConstants.defaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 200.w,
              width: 200.w,
              child: SvgPicture.asset(parms.imagePath, fit: BoxFit.fitHeight),
            ),
            CustomSpacers.height20,
            Text(parms.title.tr, style: TextStyles.const20.w700.black),
            CustomSpacers.height10,
            Text(
              parms.description.tr,
              textAlign: TextAlign.center,
              style: TextStyles.const15.w400.black,
            ),
          ],
        ),
      ),
    );
  }
}
