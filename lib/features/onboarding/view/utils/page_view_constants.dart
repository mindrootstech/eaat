import 'package:eaat/core/constants/assets.dart';
import 'package:eaat/features/onboarding/view/widgets/common_page_view_page.dart';
import 'package:eaat/utils/locale/app_locale.dart';

final pageViewList = [
  CommonPageViewParms(
    title: AppLocale.textScanYourFridge,
    description: AppLocale.textScanYourFridgeAndPantry,
    imagePath: AppAssets.svgImage.onboardingTwo,
  ),
  CommonPageViewParms(
    title: AppLocale.textAiAnalysis,
    description: AppLocale.textOurAiWillAnalyzeYourIngredients,
    imagePath: AppAssets.svgImage.onboardingOne,
  ),
  CommonPageViewParms(
    title: AppLocale.textCuratedRecipies,
    description: AppLocale.textAiSuggestRecipeWhichCanEasilyMade,
    imagePath: AppAssets.svgImage.onboardingThree,
  ),
];
