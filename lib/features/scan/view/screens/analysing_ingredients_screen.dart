import 'package:eaat/core/constants/color_palette.dart';
import 'package:eaat/core/constants/custom_spacers.dart';
import 'package:eaat/core/constants/figma_constants.dart';
import 'package:eaat/router/app_routes.dart';
import 'package:eaat/utils/themes/text_styles.dart';
import 'package:eaat/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AnalysingIngredientsScreen extends StatefulWidget {
  const AnalysingIngredientsScreen({super.key});

  @override
  State<AnalysingIngredientsScreen> createState() =>
      _AnalysingIngredientsScreenState();
}

class _AnalysingIngredientsScreenState extends State<AnalysingIngredientsScreen>
    with TickerProviderStateMixin {
  final List<String> steps = [
    'Analyzing Ingredients',
    'Analyzing Answers',
    'Generating Recipes',
    'Finalizing',
  ];

  int currentStep = 0;
  late AnimationController _progressController;
  late AnimationController _pulseController;
  late Animation<double> _progressAnimation;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _progressController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _progressAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _progressController, curve: Curves.easeInOut),
    );
    _pulseAnimation = Tween<double>(begin: 0.9, end: 1.1).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _pulseController.repeat(reverse: true);
    Future.delayed(const Duration(milliseconds: 800), updateStep);
  }

  void updateStep() {
    if (currentStep < steps.length - 1) {
      setState(() {
        currentStep++;
      });
      _progressController.animateTo((currentStep + 1) / steps.length);
      Future.delayed(const Duration(seconds: 1), updateStep);
    } else {
      Get.offNamed(AppRoutes.dashBoard);
    }
  }

  @override
  void dispose() {
    _progressController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        automaticallyImplyLeading: false,
        title: AnimatedBuilder(
          animation: _progressAnimation,
          builder: (context, child) {
            return LinearProgressIndicator(
              borderRadius: BorderRadius.circular(8),
              value: _progressAnimation.value,
              minHeight: 8,
              backgroundColor: ColorPalette.scaffoldSecondaryBackground,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.black),
            );
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(FigmaConstants.defaultPadding),
          child: Column(
            children: [
              CustomSpacers.height16,

              const Spacer(),
              AnimatedBuilder(
                animation: _pulseAnimation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _pulseAnimation.value,
                    child: Container(
                      width: 64,
                      height: 64,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        shape: BoxShape.circle,
                      ),
                      child: const CircularProgressIndicator(
                        strokeWidth: 4,
                        color: Colors.black,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 32),
              ...List.generate(steps.length, (index) {
                bool isActive = index == currentStep;
                bool isCompleted = index < currentStep;

                return AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedRotation(
                        turns: 0,
                        duration: const Duration(milliseconds: 500),
                        child: Icon(
                          Icons.check_circle,
                          color: isActive
                              ? ColorPalette.black
                              : ColorPalette.black.withOpacity(.5),
                          size: 20,
                        ),
                      ),
                      CustomSpacers.width8,
                      AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 300),
                        style: TextStyles.const12.w600.copyWith(
                          fontSize: isActive ? 18 : 15,
                          color: isActive
                              ? ColorPalette.black
                              : ColorPalette.black.withOpacity(.5),
                        ),
                        child: Text(steps[index]),
                      ),
                    ],
                  ),
                );
              }),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
