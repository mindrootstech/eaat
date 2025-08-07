import 'package:eaat/core/constants/assets.dart';
import 'package:eaat/core/constants/custom_spacers.dart';
import 'package:eaat/core/constants/figma_constants.dart';
import 'package:eaat/router/app_routes.dart';
import 'package:eaat/utils/locale/app_locale.dart';
import 'package:eaat/utils/themes/text_styles.dart';
import 'package:eaat/widgets/custom_app_bar.dart';
import 'package:eaat/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/export.dart';

class LikeTheAppScreen extends StatelessWidget {
  const LikeTheAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            onPressed: () async {
              Get.offNamed(AppRoutes.dashBoard);
            },
            child: Text(
              AppLocale.textSkip.tr,
              style: TextStyles.const15.w500.grey,
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(FigmaConstants.defaultPadding),
        child: CustomButton(
          label: AppLocale.textLeaveAReview.tr,
          onTap: () {
            Get.offNamed(AppRoutes.analysingIngredients);
          },
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.all(FigmaConstants.defaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 129.w,
                width: 126.w,
                child: SvgPicture.asset(AppAssets.svgIcons.likeThisApp),
              ),
              CustomSpacers.height40,
              Text(
                AppLocale.textLikeTheApp.tr,
                style: TextStyles.const20.w700.black,
              ),
              CustomSpacers.height10,
              Text(
                AppLocale.textLikeTheAppSubtitle.tr,
                textAlign: TextAlign.center,
                style: TextStyles.const15.w400.black,
              ),

              // Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
