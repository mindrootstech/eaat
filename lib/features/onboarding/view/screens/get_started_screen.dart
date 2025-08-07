import 'package:eaat/core/constants/assets.dart';
import 'package:eaat/core/constants/custom_spacers.dart';
import 'package:eaat/core/constants/figma_constants.dart';
import 'package:eaat/features/onboarding/view/screens/my_preferences_page_view.dart';
import 'package:eaat/router/app_routes.dart';
import 'package:eaat/utils/locale/app_locale.dart';
import 'package:eaat/utils/themes/text_styles.dart';
import 'package:eaat/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/src/extensions/export.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(FigmaConstants.defaultPadding),
        child: CustomButton(
          label: AppLocale.textGetStarted.tr,
          onTap: () => Get.offNamed(
            AppRoutes.onboarding,
            arguments: MyPreferencesPageViewType.onboarding,
          ),
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
                height: 247.w,
                width: 247.w,
                child: SvgPicture.asset(AppAssets.svgImage.getStarted),
              ),
              CustomSpacers.height40,
              Text(
                AppLocale.justScanYourIngredients.tr,
                style: TextStyles.const20.w700.black,
              ),
              Text(
                AppLocale.justScanYourIngredientsSubtitle.tr,
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
