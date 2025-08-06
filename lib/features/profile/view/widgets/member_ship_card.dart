import 'package:eaat/core/constants/color_palette.dart';
import 'package:eaat/core/constants/custom_spacers.dart';
import 'package:eaat/utils/locale/app_locale.dart';
import 'package:eaat/utils/themes/text_styles.dart';
import 'package:eaat/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MembershipCard extends StatelessWidget {
  const MembershipCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocale.membershipTitle.tr,
          style: TextStyles.const20.w700.black,
        ),
        CustomSpacers.height8,
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: ColorPalette.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: ColorPalette.primary),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row for subtitle and price
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocale.annual.tr,
                        style: TextStyles.const20.w600.black,
                      ),
                      CustomSpacers.height4,
                      Text(
                        AppLocale.membershipSubtitle.tr,
                        style: TextStyles.const15.w400.grey,
                      ),
                    ],
                  ),
                  Text(
                    AppLocale.membershipPrice.tr,
                    style: TextStyles.const16.w500.black,
                  ),
                ],
              ),
              CustomSpacers.height16,

              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    label: AppLocale.membershipSave.tr,
                    height: 27.h,
                    width: 78.w,
                    onTap: () {},
                  ),

                  CustomButton(
                    label: AppLocale.membershipCancel,
                    onTap: () {},
                    height: 27.h,
                    color: ColorPalette.red,
                    width: 122.w,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
