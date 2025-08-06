import 'package:eaat/features/onboarding/model/entities/preferences_entity.dart';
import 'package:eaat/utils/locale/app_locale.dart';

enum PreferenceType {
  dietaryPreferences,
  healthConditions,
  goals,
  allergiesAndIntolerances,
  mealPreferences,
  cookingSkill,
}

extension PreferenceTypeExtension on PreferenceType {
  String get subTitle {
    switch (this) {
      case PreferenceType.dietaryPreferences:
        return AppLocale.dietaryPreferencesSubTitle;
      case PreferenceType.healthConditions:
        return AppLocale.healthConditionsSubTitle;
      case PreferenceType.goals:
        return AppLocale.goalsSubTitle;
      case PreferenceType.allergiesAndIntolerances:
        return AppLocale.allergiesAndIntolerancesSubTitle;
      case PreferenceType.mealPreferences:
        return AppLocale.mealPreferencesSubTitle;
      case PreferenceType.cookingSkill:
        return AppLocale.cookingSkillSubTitle;
    }
  }

  String get title {
    switch (this) {
      case PreferenceType.dietaryPreferences:
        return AppLocale.dietaryPreferencesTitle;
      case PreferenceType.healthConditions:
        return AppLocale.healthConditionsTitle;
      case PreferenceType.goals:
        return AppLocale.goalsTitle;
      case PreferenceType.allergiesAndIntolerances:
        return AppLocale.allergiesAndIntolerancesTitle;
      case PreferenceType.mealPreferences:
        return AppLocale.mealPreferencesTitle;
      case PreferenceType.cookingSkill:
        return AppLocale.cookingSkillTitle;
    }
  }
}

List<PreferencesEntity> preferenceTypes = [];
