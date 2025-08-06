import 'package:eaat/features/onboarding/controllers/my_preferences_controller.dart';
import 'package:get/get.dart';

class MyPreferencesBinding extends Bindings {
  @override
  void dependencies() {
    // Register HomeController when route initializes
    Get.lazyPut<MyPreferencesController>(() => MyPreferencesController());
  }
}
