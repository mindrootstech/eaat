import 'package:eaat/core/constants/assets.dart';
import 'package:eaat/core/constants/color_palette.dart';
import 'package:eaat/core/constants/custom_spacers.dart';
import 'package:eaat/features/dashboard/profile/view/widgets/member_ship_card.dart';
import 'package:eaat/features/dashboard/profile/view/widgets/notifications_section.dart';
import 'package:eaat/features/dashboard/profile/view/widgets/others_section.dart';
import 'package:eaat/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.scaffoldSecondaryBackground,
      appBar: AppBar(
        leadingWidth: 100,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Logo(color: ColorPalette.black),
        ),
        backgroundColor: ColorPalette.scaffoldSecondaryBackground,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromRGBO(239, 239, 239, 1),
            ),
            child: SvgPicture.asset(AppAssets.svgIcons.heart),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MembershipCard(),
            CustomSpacers.height20,
            const NotificationsSection(),
            CustomSpacers.height20,
            const OthersSection(),
          ],
        ),
      ),
    );
  }
}
