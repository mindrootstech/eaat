import 'package:eaat/core/constants/color_palette.dart';
import 'package:eaat/features/dashboard/controller/dash_board_controller.dart';
import 'package:eaat/features/dashboard/profile/view/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';

class DashBoardScreen extends StatelessWidget {
  DashBoardScreen({super.key});

  final controller = Get.find<DashBoardController>();

  final List<Widget> screens = [Container(), Container(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.index.value,
          onTap: (index) => controller.tabChanged(index),
          backgroundColor: ColorPalette.white,
          selectedItemColor: Colors.black,
          unselectedItemColor: ColorPalette.darkGrey,
          showUnselectedLabels: true,
          items: List.generate(controller.items.length, (index) {
            return BottomNavigationBarItem(
              icon: SvgPicture.asset(
                controller.items[index].icon,
                colorFilter: ColorFilter.mode(
                  index == controller.index.value
                      ? Colors.black
                      : ColorPalette.darkGrey,
                  BlendMode.srcIn,
                ),
              ),
              label: controller.items[index].title,
            );
          }),
        ),
      ),
      body: Obx(() => screens[controller.index.value]),
    );
  }
}
