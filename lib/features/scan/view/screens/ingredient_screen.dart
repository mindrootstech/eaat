import 'package:eaat/core/constants/color_palette.dart';
import 'package:eaat/core/constants/custom_spacers.dart';
import 'package:eaat/core/constants/figma_constants.dart';
import 'package:eaat/features/scan/model/entities/ingredient_model.dart';
import 'package:eaat/features/scan/view/widgets/ingredients_tile.dart';
import 'package:eaat/router/app_routes.dart';
import 'package:eaat/utils/locale/app_locale.dart';
import 'package:eaat/utils/themes/text_styles.dart';
import 'package:eaat/widgets/custom_app_bar.dart';
import 'package:eaat/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IngredientScreen extends StatelessWidget {
  const IngredientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.scaffoldSecondaryBackground,
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(FigmaConstants.defaultPadding),
        child: CustomButton(
          label: AppLocale.textGetRecipies.tr,
          onTap: () {
            Get.offNamed(AppRoutes.likeTheApp);
          },
        ),
      ),
      appBar: CustomAppBar(
        title: Text(AppLocale.textIngredients.tr),
        backgroundColor: ColorPalette.scaffoldSecondaryBackground,
        actions: [
          TextButton(
            onPressed: () async {
              Get.offNamed(AppRoutes.likeTheApp);
            },
            child: Text(
              AppLocale.textSkip.tr,
              style: TextStyles.const15.w500.grey,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: FigmaConstants.defaultPadding,
        ),
        child: Column(
          children: [
            CustomSpacers.height20,
            Expanded(
              child: ListView.builder(
                itemCount: dummyIngredientModels.length,
                itemBuilder: (context, index) {
                  final product = dummyIngredientModels[index];
                  return IngredientTile(
                    title: product.title,
                    imageUrl: product.imageUrl,
                    initialQty: product.initialQty,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
