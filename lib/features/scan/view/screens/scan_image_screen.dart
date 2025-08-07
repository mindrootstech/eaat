import 'dart:io';

import 'package:eaat/core/constants/figma_constants.dart';
import 'package:eaat/router/app_routes.dart';
import 'package:eaat/utils/locale/app_locale.dart';
import 'package:eaat/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ScanImageScreen extends StatefulWidget {
  final File image;
  const ScanImageScreen({super.key, required this.image});

  @override
  State<ScanImageScreen> createState() => _ScanImageScreenState();
}

class _ScanImageScreenState extends State<ScanImageScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 10), () {
      _controller.stop();
      Get.offNamed(AppRoutes.stayNotified);
    });

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget buildScanLine(double height) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (_, __) {
        final position = _animation.value * height;
        return Positioned(
          top: position,
          left: 0,
          right: 0,
          child: Container(
            height: 40.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.1),
                  Colors.white.withOpacity(0.5),
                  Colors.white.withOpacity(0.1),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        automaticallyImplyLeading: false,
        title: Text(AppLocale.textScan),
      ),
      body: Padding(
        padding: EdgeInsets.all(FigmaConstants.defaultPadding),
        child: Center(
          child: AspectRatio(
            aspectRatio: 0.45,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Stack(
                  children: [
                    // Background Image (fridge or any other)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.file(
                        widget.image,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),

                    // Scan Line Animation
                    buildScanLine(constraints.maxHeight),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
