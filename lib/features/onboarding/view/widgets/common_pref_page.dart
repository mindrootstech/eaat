import 'package:eaat/core/constants/custom_spacers.dart';
import 'package:eaat/features/onboarding/model/entities/preferences_entity.dart';
import 'package:eaat/features/onboarding/view/utils/prefs_constants.dart';
import 'package:eaat/utils/themes/text_styles.dart';
import 'package:eaat/widgets/custom_check_box_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/export.dart';

class CommonPrefPage extends StatelessWidget {
  final PreferenceType preferenceType;
  final List<PreferencesValueEntity> preferences;
  final Function(int index, bool value) onValueChanged;
  const CommonPrefPage({
    super.key,
    required this.preferenceType,
    required this.preferences,
    required this.onValueChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          preferenceType.title.tr,
          style: TextStyles.const20.w700.black,
          textAlign: TextAlign.center,
        ),
        CustomSpacers.height10,
        Text(
          preferenceType.subTitle.tr,
          style: TextStyles.const15.w400.black,
          textAlign: TextAlign.center,
        ),
        CustomSpacers.height30,
        Expanded(
          child: ListView.separated(
            itemCount: preferences.length,
            itemBuilder: (context, index) {
              final item = preferences[index];
              return CustomCheckBoxTile(
                title: item.value,
                isSelected: item.isSelected,
                onChanged: (value) => onValueChanged(index, value ?? false),
              );
            },
            separatorBuilder: (context, index) => CustomSpacers.height6,
          ),
        ),
      ],
    );
  }
}
