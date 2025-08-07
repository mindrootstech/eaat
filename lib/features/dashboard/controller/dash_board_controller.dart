import 'package:eaat/core/constants/assets.dart';
import 'package:eaat/features/dashboard/model/entities/bottom_navigation_item_model.dart';
import 'package:eaat/utils/locale/app_locale.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoardController extends GetxController {
  RxInt index = 0.obs;
  List<Widget> screens = <Widget>[].obs;

  List<BottomNavigationItemModel> items = [
    BottomNavigationItemModel(
      icon: AppAssets.svgIcons.chefCap,
      title: AppLocale.textHome.tr,
    ),
    BottomNavigationItemModel(
      icon: AppAssets.svgIcons.apple,
      title: AppLocale.textPantry.tr,
    ),
    BottomNavigationItemModel(
      icon: AppAssets.svgIcons.person,
      title: AppLocale.textprofile.tr,
    ),
  ];

  void tabChanged(int index) {
    this.index.value = index;
  }
}
