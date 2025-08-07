import 'package:eaat/core/constants/figma_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final List<Widget>? actions;
  final Widget? leading;
  final Color? backgroundColor;
  final double height;
  final bool? automaticallyImplyLeading;

  const CustomAppBar({
    super.key,
    this.title,
    this.actions,
    this.leading,
    this.backgroundColor = Colors.white,
    this.height = kToolbarHeight,
    this.automaticallyImplyLeading,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: FigmaConstants.defaultPadding,
        ),
        child: AppBar(
          forceMaterialTransparency: true,
          actionsPadding: EdgeInsetsDirectional.zero,
          leadingWidth: FigmaConstants.defaultPadding,
          backgroundColor: backgroundColor,
          automaticallyImplyLeading: automaticallyImplyLeading ?? true,
          elevation: 0,
          title: title,
          leading: leading,
          actions: actions,
          centerTitle: true,
        ),
      ),
    );
  }
}
