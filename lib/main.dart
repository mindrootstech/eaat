import 'package:eaat/core/managers/app_manager.dart';

import 'package:eaat/features/onboarding/view/screens/splash_screen.dart';
import 'package:eaat/router/app_routes.dart';
import 'package:eaat/router/get_routes.dart';
import 'package:eaat/utils/locale/app_locale.dart';
import 'package:eaat/utils/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppManager.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 734),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          scrollBehavior: ScrollBehavior().copyWith(
            physics: const ClampingScrollPhysics(),
          ),
          translations: AppLocale(),
          supportedLocales: AppLocale().localization.supportedLocales,
          localizationsDelegates:
              AppLocale().localization.localizationsDelegates,
          locale: Locale('en', 'US'),
          fallbackLocale: Locale('en', 'US'),
          debugShowCheckedModeBanner: false,
          title: 'EAAT',
          theme: AppTheme.lightTheme,
          getPages: GetRoutes.routes,
          initialRoute: AppRoutes.splash,
          defaultTransition: Transition.rightToLeft,
          home: child,
        );
      },
      child: SplashScreen(),
    );
  }
}
