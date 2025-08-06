import 'package:eaat/core/constants/color_palette.dart';
import 'package:eaat/core/constants/custom_spacers.dart';
import 'package:eaat/core/constants/figma_constants.dart';
import 'package:eaat/features/onboarding/controllers/my_preferences_controller.dart';
import 'package:eaat/features/onboarding/view/widgets/common_pref_page.dart';
import 'package:eaat/utils/locale/app_locale.dart';
import 'package:eaat/utils/themes/text_styles.dart';
import 'package:eaat/widgets/custom_button.dart';
import 'package:eaat/widgets/page_view_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

class MyPreferencesPageView extends StatelessWidget {
  MyPreferencesPageView({super.key});
  final controller = Get.find<MyPreferencesController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_outlined, color: Colors.black),
          onPressed: () => controller.previousPage(),
        ),
        actions: [
          Obx(
            () => Text(
              '${controller.currentPage.value + 1}/${controller.pageList.length}',
              style: TextStyles.const15.w400.black,
            ),
          ),
          CustomSpacers.width25,
        ],
        backgroundColor: ColorPalette.scaffoldSecondaryBackground,
        title: PageViewIndicator(
          pageController: controller.pageController,
          size: controller.pageList.length,
        ),
      ),

      bottomNavigationBar: Container(
        color: ColorPalette.scaffoldSecondaryBackground,
        child: Padding(
          padding: EdgeInsets.all(FigmaConstants.defaultPadding),
          child: CustomButton(
            label: AppLocale.textNext.tr,
            onTap: () => controller.nextPage(),
          ),
        ),
      ),
      backgroundColor: ColorPalette.scaffoldSecondaryBackground,
      body: Column(
        children: [
          // CustomSpacers.height10,
          _buildPageView(controller),
          // CustomSpacers.height40,
        ],
      ),
    );
  }

  Widget _buildPageView(MyPreferencesController controller) {
    return Container(
      padding: EdgeInsets.all(FigmaConstants.defaultPadding),
      height:
          MediaQuery.of(Get.context!).size.height * .72, // or a fixed height
      child: PageView.builder(
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
    );
  }
}
