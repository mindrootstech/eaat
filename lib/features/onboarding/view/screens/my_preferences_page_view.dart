import 'package:eaat/core/constants/color_palette.dart';
import 'package:eaat/core/constants/custom_spacers.dart';
import 'package:eaat/core/constants/figma_constants.dart';
import 'package:eaat/features/onboarding/controllers/my_preferences_controller.dart';
import 'package:eaat/features/onboarding/view/widgets/common_pref_page.dart';
import 'package:eaat/utils/locale/app_locale.dart';
import 'package:eaat/utils/themes/text_styles.dart';
import 'package:eaat/widgets/custom_app_bar.dart';
import 'package:eaat/widgets/custom_button.dart';
import 'package:eaat/widgets/page_view_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

enum MyPreferencesPageViewType { onboarding, profile }

extension MyPreferencesPageViewTypeExtension on MyPreferencesPageViewType {
  bool get isOnboarding => this == MyPreferencesPageViewType.onboarding;
  bool get isProfile => this == MyPreferencesPageViewType.profile;
}

class MyPreferencesPageView extends StatelessWidget {
  final MyPreferencesPageViewType type;
  MyPreferencesPageView({super.key, required this.type});
  final controller = Get.find<MyPreferencesController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: Visibility(
          visible:
              type.isOnboarding &&
              controller.currentPage.value >= controller.pageList.length - 1,
          child: GestureDetector(
            child: const Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.black,
            ),
            onTap: () => type.isProfile
                ? controller.currentPage >= controller.pageList.length - 1
                      ? Get.back()
                      : controller.previousPage()
                : Get.back(),
          ),
        ),
        actions: [
          if (type.isOnboarding)
            Obx(
              () => Text(
                '${controller.currentPage.value + 1}/${controller.pageList.length}',
                style: TextStyles.const15.w400.black,
              ),
            ),
        ],
        backgroundColor: ColorPalette.scaffoldSecondaryBackground,
        title: type.isOnboarding
            ? PageViewIndicator(
                pageController: controller.pageController,
                size: controller.pageList.length,
              )
            : Text(AppLocale.myPreferences.tr),
      ),

      backgroundColor: ColorPalette.scaffoldSecondaryBackground,
      body: _buildPageView(controller),
    );
  }

  Widget _buildPageView(MyPreferencesController controller) {
    return Stack(
      children: [
        PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          itemCount: controller.pageList.length,
          itemBuilder: (context, index) {
            return Obx(
              () => CommonPrefPage(
                preferenceType: controller.pageList[index],
                onValueChanged: controller.selectValue,
                preferences: controller.preferences[index].values,
              ),
            );
          },
        ),

        Align(
          alignment: Alignment.bottomCenter,
          child: Obx(
            () => Container(
              color: Colors.transparent,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: FigmaConstants.defaultPadding,
                  left: FigmaConstants.defaultPadding,
                  right: FigmaConstants.defaultPadding,
                ),
                child: CustomButton(
                  label: _actionButtonLabel,
                  onTap: () {
                    if (controller.currentPage.value ==
                        controller.pageList.length - 1) {
                      if (type.isOnboarding) {
                        controller.finishOnboarding();
                      } else {
                        controller.finshSavedPrefs();
                      }
                    } else {
                      controller.nextPage();
                    }
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  String get _actionButtonLabel {
    final isLastPage =
        controller.currentPage.value == controller.pageList.length - 1;

    if (isLastPage) {
      if (type.isOnboarding) return AppLocale.textFinish.tr;
      if (type.isProfile) return AppLocale.textSave.tr;
    }

    return AppLocale.textNext.tr;
  }
}
