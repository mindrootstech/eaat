import 'package:eaat/core/constants/color_palette.dart';
import 'package:eaat/core/constants/custom_spacers.dart';
import 'package:eaat/utils/locale/app_locale.dart';
import 'package:eaat/utils/themes/text_styles.dart';
import 'package:eaat/widgets/switch_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/export.dart';

class NotificationsSection extends StatelessWidget {
  const NotificationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppLocale.notifications.tr, style: TextStyles.const20.w700.black),
        CustomSpacers.height8,
        SwitchTile(title: AppLocale.recipeNotification.tr, onChanged: (val) {}),
        CustomSpacers.height8,
        SwitchTile(title: AppLocale.scanReminder.tr, onChanged: (val) {}),
      ],
    );
  }
}
