import 'dart:async';

import 'package:eaat/core/constants/color_palette.dart';
import 'package:eaat/core/constants/custom_spacers.dart';
import 'package:eaat/core/constants/figma_constants.dart';
import 'package:eaat/features/onboarding/view/utils/page_view_constants.dart';
import 'package:eaat/features/onboarding/view/widgets/animated_button_with_back.dart';
import 'package:eaat/features/onboarding/view/widgets/common_page_view_page.dart';
import 'package:eaat/widgets/custom_app_bar.dart';
import 'package:eaat/widgets/page_view_indicator.dart';
import 'package:flutter/material.dart';

class OnboardingPageView extends StatefulWidget {
  const OnboardingPageView({super.key});

  @override
  State<OnboardingPageView> createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends State<OnboardingPageView> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose(); // Always dispose controllers
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorPalette.scaffoldSecondaryBackground,
        title: PageViewIndicator(
          pageController: _pageController,
          size: pageViewList.length,
        ),
      ),
      backgroundColor: ColorPalette.scaffoldSecondaryBackground,
      bottomNavigationBar: SingleChildScrollView(
        padding: EdgeInsets.all(FigmaConstants.defaultPadding),
        child: AnimatedButtonWithBack(controller: _pageController),
      ),
      body: Column(children: [CustomSpacers.height60, _buildPageView()]),
    );
  }

  Widget _buildPageView() {
    return Expanded(
      // Ensures the PageView fills available space
      child: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        itemCount: pageViewList.length,
        itemBuilder: (context, index) {
          return CommmonPageViewPage(parms: pageViewList[index]); // Fixed typo
        },
      ),
    );
  }
}
