import 'package:eaat/features/onboarding/controllers/my_preferences_binding.dart';
import 'package:eaat/features/onboarding/view/screens/get_started_screen.dart';
import 'package:eaat/features/onboarding/view/screens/my_preferences_page_view.dart';
import 'package:eaat/features/onboarding/view/screens/onboarding_page_view.dart';
import 'package:eaat/features/onboarding/view/screens/splash_screen.dart';
import 'package:eaat/features/profile/view/screens/profile_screen.dart';
import 'package:eaat/router/app_routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

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
      page: () => MyPreferencesPageView(),
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
  ];
}
