import 'package:eaat/core/constants/color_palette.dart';
import 'package:eaat/core/constants/figma_constants.dart';
import 'package:eaat/features/onboarding/view/screens/my_preferences_page_view.dart';
import 'package:eaat/features/onboarding/view/utils/page_view_constants.dart';
import 'package:eaat/router/app_routes.dart';
import 'package:eaat/utils/locale/app_locale.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimatedButtonWithBack extends StatefulWidget {
  final PageController controller;
  const AnimatedButtonWithBack({super.key, required this.controller});

  @override
  State<AnimatedButtonWithBack> createState() => _AnimatedButtonWithBackState();
}

class _AnimatedButtonWithBackState extends State<AnimatedButtonWithBack> {
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      if (super.mounted) {
        setState(() {
          currentPage = widget.controller.page!.toInt();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    double targetWidth = currentPage == 0
        ? screenWidth * 0.85
        : screenWidth * 0.4;

    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 200),
      tween: Tween<double>(begin: targetWidth, end: targetWidth),
      builder: (context, width, child) {
        return Row(
          children: [
            if (currentPage > 0)
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: ColorPalette.white,
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_rounded),
                  onPressed: () {
                    widget.controller.previousPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ),
            if (currentPage > 0) const SizedBox(width: 8),
            Expanded(
              child: Align(
                alignment: currentPage == 0
                    ? Alignment.center
                    : Alignment.centerRight,
                child: SizedBox(
                  height: FigmaConstants.defaultButtonHeight,
                  width: width,
                  child: ElevatedButton(
                    onPressed: () {
                      if (currentPage < pageViewList.length - 1) {
                        widget.controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        Get.offNamed(
                          AppRoutes.onboardingPreferences,
                          arguments: MyPreferencesPageViewType.onboarding,
                        );
                      }
                    },
                    child: Text(
                      currentPage < pageViewList.length - 1
                          ? AppLocale.textNext.tr
                          : AppLocale.textFinish.tr,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
