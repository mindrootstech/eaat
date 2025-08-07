import 'dart:ui';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';

/// A mixin that provides localization setup and constants for the application.
class AppLocale extends Translations {
  final FlutterLocalization localization = FlutterLocalization.instance;

  Future<void> init() async {
    await localization.ensureInitialized();
    AppLocale().setUpLocals(localization);
  }

  void setUpLocals(FlutterLocalization localization) {
    localization.init(
      mapLocales: [MapLocale('en', keys, countryCode: 'US')],
      initLanguageCode: 'en',
    );
    localization.onTranslatedLanguage = _onTranslatedLanguage;
  }

  /// Callback function that is called when the language is translated.
  static void _onTranslatedLanguage(Locale? locale) {}

  @override
  Map<String, Map<String, String>> get keys => {
    'en': {
      textGoToHome: 'Go to home',
      textScanYourIngredients: 'Scan your ingredients',
      textAndCook: 'and get recipes to cook. ',
      textScanYourFridge: 'Scan your fridge',
      textScanYourFridgeAndPantry:
          'Scan your fridge or pantry with the app and let AI do its magic',
      textAiAnalysis: 'AI analysis',
      textOurAiWillAnalyzeYourIngredients:
          'Our AI will analyze your ingredients and generates recipes ',
      textCuratedRecipies: 'Curated recipies',
      textAiSuggestRecipeWhichCanEasilyMade:
          'AI suggests recipes which can be easily made with your ingredients.',
      textGetStarted: 'Get Started',
      textNext: 'Next',
      textFinish: 'Finish',

      // PreferenceType titles & subtitles
      dietaryPreferencesTitle: 'Dietary Preferences',
      dietaryPreferencesSubTitle:
          'Which of the following best describes your diet?',

      healthConditionsTitle: 'Health Conditions',
      healthConditionsSubTitle:
          'Do you follow a diet due to a medical condition?',

      goalsTitle: 'Goals',
      goalsSubTitle: 'Do you have specific health goals?',

      allergiesAndIntolerancesTitle: 'Allergies & Intolerances',
      allergiesAndIntolerancesSubTitle:
          'Do you have any food allergies or intolerances?',

      mealPreferencesTitle: 'Meal Preferences',
      mealPreferencesSubTitle: 'What meals do you typically prepare at home?',

      cookingSkillTitle: 'Cooking Skill',
      cookingSkillSubTitle: 'How would you describe your cooking skill level?',

      // Dietary Preferences options
      omnivore: 'Omnivore',
      vegetarian: 'Vegetarian',
      vegan: 'Vegan',
      pescatarian: 'Pescatarian',
      keto: 'Keto',
      lowCarbLowFat: 'Low-carb / Low-fat',
      glutenFree: 'Gluten-free',
      dairyFree: 'Dairy-free',

      // Health Conditions options
      diabetes: 'Diabetes',
      highCholesterol: 'High cholesterol',
      hypertension: 'Hypertension',
      celiacDisease: 'Celiac disease',
      heartDisease: 'Heart disease',
      pregnancy: 'Pregnancy',

      // Goals options
      loseWeight: 'Lose weight',
      buildMuscle: 'Build muscle',
      improveHeartHealth: 'Improve heart health',
      boostEnergy: 'Boost energy',
      eatMorePlantBased: 'Eat more plant-based',
      improveDigestion: 'Improve digestion',
      manageBloodSugar: 'Manage blood sugar',
      noSpecificGoal: 'No specific goal',

      // Allergies & Intolerances options
      peanuts: 'Peanuts',
      treeNuts: 'Tree nuts',
      gluten: 'Gluten',
      dairyLactose: 'Dairy / lactose',
      soy: 'Soy',
      shellfish: 'Shellfish',
      eggs: 'Eggs',
      none: 'None',

      // Meal Preferences options
      breakfast: 'Breakfast',
      lunch: 'Lunch',
      dinner: 'Dinner',
      snacks: 'Snacks',
      desserts: 'Desserts',
      mealPrepBatchCooking: 'Meal prep / batch cooking',

      // Cooking Skill options
      beginner: 'Beginner',
      intermediate: 'Intermediate',
      experienced: 'Experienced',
      professional: 'Professional',
      membership: 'Membership',

      membershipTitle: 'Membership',
      membershipSubtitle: '\$5.99 per month',
      membershipPrice: '\$59.99',
      membershipSave: 'Saving 20%',
      membershipCancel: 'Cancel Membership',
      annual: 'Annual',
      notifications: 'Notifications',
      recipeNotification: 'Recipe Notification',
      scanReminder: 'Scan Reminder',
      others: 'Others',
      myPreferences: 'My Preferences',
      termsOfUse: 'Terms of Use',
      privacyPolicy: 'Privacy Policy',
      textSave: 'Save',
      textSkip: 'Skip',
      textScan: 'Scan',
      textLetsScan: 'Let\'s scan',
      textStayNotified: 'Stay Notified',
      textLetsScanSubtitle:
          'lets scan your fridge and pantry to analyze the ingredients',
      textOpenCamera: 'Open Camera',
      textGetHealthTips: 'Get health tips & new recipes',
      textGetHealthTipsSubtitle:
          'We will notify you about your health and when new recipes arrive',
      textAllow: 'Allow',
      textIngredients: 'Ingredients',
      textGetRecipies: 'Get Recipies',
      textQty: 'Qty',
      textLikeTheApp: 'Like the app',
      textLeaveAReview: 'Leave a review',
      textLikeTheAppSubtitle:
          'Leave a 5 star review to let the community know what they are missing on.',
      textHome: 'Home',
      textPantry: 'Pantry',
      textprofile: 'Profile',
      justScanYourIngredientsSubtitle: 'and get recipes to cook. ',
      justScanYourIngredients: 'Just scan your ingredients',
    },
  };

  static String myPreferences = 'myPreferences'.tr;
  static String textQty = 'textQty'.tr;
  static String textScan = 'Scan'.tr;
  static String textIngredients = 'textIngredients'.tr;
  static String textGetRecipies = 'textGetRecipies'.tr;
  static String textLetsScan = 'textLetsScan'.tr;
  static String textLetsScanSubtitle = 'textLetsScanSubtitle'.tr;
  static String textGetHealthTips = 'textGetHealthTips'.tr;
  static String textGetHealthTipsSubtitle = 'textGetHealthTipsSubtitle'.tr;

  static String termsOfUse = 'termsOfUse'.tr;
  static String privacyPolicy = 'privacyPolicy'.tr;
  static String justScanYourIngredients = 'justScanYourIngredients'.tr;
  static String justScanYourIngredientsSubtitle =
      'justScanYourIngredientsSubtitle'.tr;

  /// Dashboard
  static String textGoToHome = 'textGoToHome'.tr;
  static String textScanYourIngredients = 'textScanYourIngredients'.tr;
  static String textAndCook = 'textAndCook'.tr;
  static String textScanYourFridge = 'textScanYourFridge'.tr;
  static String textLikeTheApp = 'textLikeTheApp'.tr;
  static String textHome = 'textHome'.tr;
  static String textPantry = 'textPantry'.tr;
  static String textprofile = 'textprofile'.tr;
  static String textLikeTheAppSubtitle = 'textLikeTheAppSubtitle'.tr;
  static String textLeaveAReview = 'textLeaveAReview'.tr;
  static String textScanYourFridgeAndPantry = 'textScanYourFridgeAndPantry'.tr;

  static String textAiAnalysis = 'textAiAnalysis'.tr;
  static String textOurAiWillAnalyzeYourIngredients =
      'textOurAiWillAnalyzeYourIngredients'.tr;
  static String textCuratedRecipies = 'textCuratedRecipies'.tr;
  static String textAiSuggestRecipeWhichCanEasilyMade =
      'textAiSuggestRecipeWhichCanEasilyMade'.tr;

  static String textGetStarted = 'textGetStarted'.tr;
  static String textOpenCamera = 'textOpenCamera'.tr;
  static String textAllow = 'textAllow'.tr;

  static String textNext = 'textNext'.tr;
  static String textSkip = 'textSkip'.tr;
  static String textStayNotified = 'textStayNotified'.tr;
  static String textSave = 'textSave'.tr;

  static String textFinish = 'textFinish'.tr;

  static String get dietaryPreferencesTitle => 'dietaryPreferencesTitle'.tr;
  static String get dietaryPreferencesSubTitle =>
      'dietaryPreferencesSubTitle'.tr;

  static String get healthConditionsTitle => 'healthConditionsTitle'.tr;
  static String get healthConditionsSubTitle => 'healthConditionsSubTitle'.tr;

  static String get goalsTitle => 'goalsTitle'.tr;
  static String get goalsSubTitle => 'goalsSubTitle'.tr;

  static String get allergiesAndIntolerancesTitle =>
      'allergiesAndIntolerancesTitle'.tr;
  static String get allergiesAndIntolerancesSubTitle =>
      'allergiesAndIntolerancesSubTitle'.tr;

  static String get mealPreferencesTitle => 'mealPreferencesTitle'.tr;
  static String get mealPreferencesSubTitle => 'mealPreferencesSubTitle'.tr;

  static String get cookingSkillTitle => 'cookingSkillTitle'.tr;
  static String get cookingSkillSubTitle => 'cookingSkillSubTitle'.tr;

  // Dietary Preferences options
  static String get omnivore => 'omnivore'.tr;
  static String get vegetarian => 'vegetarian'.tr;
  static String get vegan => 'vegan'.tr;
  static String get pescatarian => 'pescatarian'.tr;
  static String get keto => 'keto'.tr;
  static String get lowCarbLowFat => 'lowCarbLowFat'.tr;
  static String get glutenFree => 'glutenFree'.tr;
  static String get dairyFree => 'dairyFree'.tr;

  // Health Conditions options
  static String get diabetes => 'diabetes'.tr;
  static String get highCholesterol => 'highCholesterol'.tr;
  static String get hypertension => 'hypertension'.tr;
  static String get celiacDisease => 'celiacDisease'.tr;
  static String get heartDisease => 'heartDisease'.tr;
  static String get pregnancy => 'pregnancy'.tr;

  // Goals options
  static String get loseWeight => 'loseWeight'.tr;
  static String get buildMuscle => 'buildMuscle'.tr;
  static String get improveHeartHealth => 'improveHeartHealth'.tr;
  static String get boostEnergy => 'boostEnergy'.tr;
  static String get eatMorePlantBased => 'eatMorePlantBased'.tr;
  static String get improveDigestion => 'improveDigestion'.tr;
  static String get manageBloodSugar => 'manageBloodSugar'.tr;
  static String get noSpecificGoal => 'noSpecificGoal'.tr;

  // Allergies & Intolerances options
  static String get peanuts => 'peanuts'.tr;
  static String get treeNuts => 'treeNuts'.tr;
  static String get gluten => 'gluten'.tr;
  static String get dairyLactose => 'dairyLactose'.tr;
  static String get soy => 'soy'.tr;
  static String get shellfish => 'shellfish'.tr;
  static String get eggs => 'eggs'.tr;
  static String get none => 'none'.tr;

  // Meal Preferences options
  static String get breakfast => 'breakfast'.tr;
  static String get lunch => 'lunch'.tr;
  static String get dinner => 'dinner'.tr;
  static String get snacks => 'snacks'.tr;
  static String get desserts => 'desserts'.tr;
  static String get mealPrepBatchCooking => 'mealPrepBatchCooking'.tr;

  // Cooking Skill options
  static String get beginner => 'beginner'.tr;
  static String get intermediate => 'intermediate'.tr;
  static String get experienced => 'experienced'.tr;
  static String get professional => 'professional'.tr;

  static String get membership => 'membership'.tr;

  static String get membershipTitle => 'membershipTitle'.tr;
  static String get others => 'others'.tr;
  static String get notifications => 'notifications'.tr;
  static String get membershipSubtitle => 'membershipSubtitle'.tr;
  static String get membershipPrice => 'membershipPrice'.tr;
  static String get membershipSave => 'membershipSave'.tr;
  static String get membershipCancel => 'membershipCancel'.tr;
  static String get annual => 'Annual'.tr;
  static String get recipeNotification => 'recipeNotification'.tr;
  static String get scanReminder => 'scanReminder'.tr;
}
