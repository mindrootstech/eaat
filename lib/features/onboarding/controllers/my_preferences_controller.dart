import 'package:eaat/core/constants/global.dart';
import 'package:eaat/features/onboarding/model/entities/preferences_entity.dart';
import 'package:eaat/features/onboarding/model/repositories/my_preferences_repository.dart';
import 'package:eaat/features/onboarding/view/utils/prefs_constants.dart';
import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';

class MyPreferencesController extends GetxController {
  RxList<PreferencesEntity> preferences = RxList<PreferencesEntity>([]);
  MyPreferencesRepository myPreferencesRepository = MyPreferencesRepository();
  RxInt currentPage = 0.obs;

  late PageController _pageController;

  PageController get pageController => _pageController;

  final pageList = PreferenceType.values;

  @override
  void onInit() {
    preferences.value = Global.preferences;
    _pageController = PageController(initialPage: 0);
    getPrefAndUpdate();
    _pageController.addListener(() {
      currentPage.value = _pageController.page!.toInt();
      getPrefAndUpdate();
    });
    super.onInit();
  }

  void getPrefAndUpdate() {
    myPreferencesRepository
        .getMyPreferences(preferenceType: pageList[currentPage.value])
        .then((value) {
          preferences[currentPage.value] = preferences[currentPage.value]
              .copyWith(
                values: value.fold(
                  (L) => null,
                  (List<PreferencesValueEntity> ifRight) => ifRight.isNotEmpty
                      ? ifRight
                      : preferences[currentPage.value].values,
                ),
              );
        });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void selectValue(int index, bool value) {
    if (currentPage.value == pageList.length - 1) {
      for (int i = 0; i < preferences[currentPage.value].values.length; i++) {
        if (i != index) {
          preferences[currentPage.value].values[i] =
              preferences[currentPage.value].values[i].copyWith(
                isSelected: false,
              );
        } else {
          preferences[currentPage.value].values[i] =
              preferences[currentPage.value].values[i].copyWith(
                isSelected: true,
              );
        }
      }
      debugPrint(preferences[currentPage.value].values.toString());
      preferences.refresh();
      return;
    }

    preferences[currentPage.value].values[index] =
        preferences[currentPage.value].values[index].copyWith(
          isSelected: value,
        );
  }

  Future<void> nextPage() async {
    await saveMyPreferences();
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void previousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Future<void> saveMyPreferences() async {
    final prefs = preferences[currentPage.value].values
        .map((e) => e.toCompanion())
        .toList();
    await myPreferencesRepository.saveMyPreferences(prefs);
  }
}
