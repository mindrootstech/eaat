import 'package:eaat/core/constants/custom_spacers.dart';
import 'package:eaat/features/onboarding/view/screens/my_preferences_page_view.dart';
import 'package:eaat/router/app_routes.dart';
import 'package:eaat/utils/locale/app_locale.dart';
import 'package:eaat/utils/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:get/route_manager.dart';

class OthersSection extends StatelessWidget {
  const OthersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppLocale.others.tr, style: TextStyles.const20.w700.black),
        CustomSpacers.height8,
        _buildTile(
          AppLocale.myPreferences.tr,
          () => Get.toNamed(
            AppRoutes.onboardingPreferences,
            arguments: MyPreferencesPageViewType.profile,
          ),
        ),
        CustomSpacers.height8,
        _buildTile(AppLocale.termsOfUse.tr, () {}),
        CustomSpacers.height8,
        _buildTile(AppLocale.privacyPolicy.tr, () {}),
        CustomSpacers.height8,
      ],
    );
  }

  Widget _buildTile(String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyles.const15.w500.black),
            Icon(Icons.arrow_forward_ios_outlined),
          ],
        ),
      ),
    );
  }
}
