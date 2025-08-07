import 'dart:io';

import 'package:eaat/features/dashboard/controller/dash_board_controller_binding.dart';
import 'package:eaat/features/dashboard/view/screens/dash_board_screen.dart';
import 'package:eaat/features/onboarding/controllers/my_preferences_binding.dart';
import 'package:eaat/features/onboarding/view/screens/get_started_screen.dart';
import 'package:eaat/features/onboarding/view/screens/like_the_app_screen.dart';
import 'package:eaat/features/onboarding/view/screens/my_preferences_page_view.dart';
import 'package:eaat/features/onboarding/view/screens/onboarding_page_view.dart';
import 'package:eaat/features/onboarding/view/screens/scan_your_fridge.dart';
import 'package:eaat/features/onboarding/view/screens/splash_screen.dart';
import 'package:eaat/features/onboarding/view/screens/stay_notified_screen.dart';
import 'package:eaat/features/dashboard/profile/view/screens/profile_screen.dart';
import 'package:eaat/features/scan/view/screens/analysing_ingredients_screen.dart';
import 'package:eaat/features/scan/view/screens/ingredient_screen.dart';
import 'package:eaat/features/scan/view/screens/scan_image_screen.dart';
import 'package:eaat/router/app_routes.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/route_manager.dart';

class GetRoutes {
  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashScreen(),
      // binding: SplashBinding(), // Optional: if you have bindings
    ),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => OnboardingPageView(),
      // binding: OnboardingBinding(),
    ),
    GetPage(
      name: AppRoutes.onboardingPreferences,
      page: () {
        final type = Get.arguments as MyPreferencesPageViewType;
        return MyPreferencesPageView(type: type);
      },
      binding: MyPreferencesBinding(),
    ),

    GetPage(
      name: AppRoutes.getStarted,
      page: () => GetStartedScreen(),
      // binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => ProfileScreen(),
      // binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.scan,
      page: () => ScanYourFrigeScreen(),
      // binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.scanImageScreen,
      page: () => ScanImageScreen(image: Get.arguments as File),
    ),
    GetPage(name: AppRoutes.stayNotified, page: () => StayNotifiedScreen()),
    GetPage(name: AppRoutes.ingredients, page: () => IngredientScreen()),
    GetPage(name: AppRoutes.likeTheApp, page: () => LikeTheAppScreen()),
    GetPage(
      name: AppRoutes.analysingIngredients,
      page: () => AnalysingIngredientsScreen(),
    ),
    GetPage(
      name: AppRoutes.dashBoard,
      page: () => DashBoardScreen(),
      binding: DashBoardControllerBinding(),
    ),
  ];
}
