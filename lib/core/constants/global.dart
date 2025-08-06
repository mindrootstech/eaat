import 'package:eaat/core/data_sources/local/database/app_local_db.dart';
import 'package:eaat/features/onboarding/model/entities/preferences_entity.dart';
import 'package:eaat/features/onboarding/view/utils/prefs_constants.dart';
import 'package:eaat/utils/locale/app_locale.dart';

class Global {
  static final dataBase = AppDatabase();

  // Private lists using localized strings
  static final List<String> _dietaryPreferences = [
    AppLocale.omnivore,
    AppLocale.vegetarian,
    AppLocale.vegan,
    AppLocale.pescatarian,
    AppLocale.keto,
    AppLocale.lowCarbLowFat,
    AppLocale.glutenFree,
    AppLocale.dairyFree,
  ];

  static final List<String> _healthConditions = [
    AppLocale.diabetes,
    AppLocale.highCholesterol,
    AppLocale.hypertension,
    AppLocale.celiacDisease,
    AppLocale.heartDisease,
    AppLocale.pregnancy,
  ];

  static final List<String> _goals = [
    AppLocale.loseWeight,
    AppLocale.buildMuscle,
    AppLocale.improveHeartHealth,
    AppLocale.boostEnergy,
    AppLocale.eatMorePlantBased,
    AppLocale.improveDigestion,
    AppLocale.manageBloodSugar,
    AppLocale.noSpecificGoal,
  ];

  static final List<String> _allergiesAndIntolerances = [
    AppLocale.peanuts,
    AppLocale.treeNuts,
    AppLocale.gluten,
    AppLocale.dairyLactose,
    AppLocale.soy,
    AppLocale.shellfish,
    AppLocale.eggs,
    AppLocale.none,
  ];

  static final List<String> _mealPreferences = [
    AppLocale.breakfast,
    AppLocale.lunch,
    AppLocale.dinner,
    AppLocale.snacks,
    AppLocale.desserts,
    AppLocale.mealPrepBatchCooking,
  ];

  static final List<String> _cookingSkill = [
    AppLocale.beginner,
    AppLocale.intermediate,
    AppLocale.experienced,
    AppLocale.professional,
  ];

  // Public getters
  static List<String> get dietaryPreferencesOptions => _dietaryPreferences;
  static List<String> get healthConditionsOptions => _healthConditions;
  static List<String> get goalsOptions => _goals;
  static List<String> get allergiesAndIntolerancesOptions =>
      _allergiesAndIntolerances;
  static List<String> get mealPreferencesOptions => _mealPreferences;
  static List<String> get cookingSkillOptions => _cookingSkill;

  // Full preferences list including all types
  static List<PreferencesEntity> preferences = [
    PreferencesEntity(
      preferenceType: PreferenceType.dietaryPreferences,
      values: _dietaryPreferences
          .map(
            (e) => PreferencesValueEntity(
              preferenceType: PreferenceType.dietaryPreferences,
              value: e,
              isSelected: false,
            ),
          )
          .toList(),
    ),
    PreferencesEntity(
      preferenceType: PreferenceType.healthConditions,
      values: _healthConditions
          .map(
            (e) => PreferencesValueEntity(
              preferenceType: PreferenceType.healthConditions,
              value: e,
              isSelected: false,
            ),
          )
          .toList(),
    ),
    PreferencesEntity(
      preferenceType: PreferenceType.goals,
      values: _goals
          .map(
            (e) => PreferencesValueEntity(
              preferenceType: PreferenceType.goals,
              value: e,
              isSelected: false,
            ),
          )
          .toList(),
    ),

    PreferencesEntity(
      preferenceType: PreferenceType.allergiesAndIntolerances,
      values: _allergiesAndIntolerances
          .map(
            (e) => PreferencesValueEntity(
              preferenceType: PreferenceType.allergiesAndIntolerances,
              value: e,
              isSelected: false,
            ),
          )
          .toList(),
    ),
    PreferencesEntity(
      preferenceType: PreferenceType.mealPreferences,
      values: _mealPreferences
          .map(
            (e) => PreferencesValueEntity(
              preferenceType: PreferenceType.mealPreferences,
              value: e,
              isSelected: false,
            ),
          )
          .toList(),
    ),
    PreferencesEntity(
      preferenceType: PreferenceType.cookingSkill,
      values: _cookingSkill
          .map(
            (e) => PreferencesValueEntity(
              preferenceType: PreferenceType.cookingSkill,
              value: e,
              isSelected: false,
            ),
          )
          .toList(),
    ),
  ];
}
