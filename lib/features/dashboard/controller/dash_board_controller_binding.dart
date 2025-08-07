import 'package:eaat/features/dashboard/controller/dash_board_controller.dart';
import 'package:get/get.dart';

class DashBoardControllerBinding extends Bindings {
  @override
  void dependencies() {
    // Register HomeController when route initializes
    Get.lazyPut<DashBoardController>(() => DashBoardController());
  }
}
