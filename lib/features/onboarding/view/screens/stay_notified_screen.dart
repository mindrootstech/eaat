import 'package:eaat/core/constants/assets.dart';
import 'package:eaat/core/constants/custom_spacers.dart';
import 'package:eaat/core/constants/figma_constants.dart';
import 'package:eaat/core/managers/permission_manager.dart';
import 'package:eaat/router/app_routes.dart';
import 'package:eaat/utils/locale/app_locale.dart';
import 'package:eaat/utils/themes/text_styles.dart';
import 'package:eaat/widgets/custom_app_bar.dart';
import 'package:eaat/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class StayNotifiedScreen extends StatelessWidget {
  const StayNotifiedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        automaticallyImplyLeading: false,
        title: Text(AppLocale.textStayNotified.tr),
        actions: [
          TextButton(
            onPressed: () async {
              Get.offNamed(AppRoutes.ingredients);
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
          label: AppLocale.textAllow.tr,
          onTap: () {
            AppPermissionManager.requestNotificationPermission().then((value) {
              if (value) {
                Get.offNamed(AppRoutes.ingredients);
              }
            });
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(FigmaConstants.defaultPadding),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomSpacers.height40,
              SizedBox(
                height: 291.h,
                width: 306.w,
                child: Image.asset(AppAssets.images.notification.tr),
              ),
              CustomSpacers.height20,
              Text(
                AppLocale.textGetHealthTips.tr,
                style: TextStyles.const20.w700.black,
                textAlign: TextAlign.center,
              ),
              CustomSpacers.height10,
              Text(
                AppLocale.textGetHealthTipsSubtitle.tr,
                style: TextStyles.const15.w400.black,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
