import 'package:eaat/core/constants/assets.dart';
import 'package:eaat/router/app_routes.dart';
import 'package:eaat/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      _naviagate();
    });
    super.initState();
  }

  void _naviagate() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(AppRoutes.getStarted);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset(AppAssets.images.background)),
          Center(child: Logo()),
        ],
      ),
    );
  }
}
