import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/core/theme/app_colors.dart';

class CAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CAppBar({
    this.actions,
    this.automaticallyImplyLeading = true,
    this.backgroundColor = AppColors.white,
    this.centerTitle,
    this.leading,
    this.title,
    this.titleText = '',
    this.statusBarBrightness = Brightness.dark,
    this.foregroundColor = Colors.black,
    this.titleTextStyle,
    this.bottom,
    this.leadingWidth = 30, //default 56
    this.titleSpacing,
    super.key,
  });


  final List<Widget>? actions;
  final bool automaticallyImplyLeading;
  final Color? backgroundColor;
  final PreferredSizeWidget? bottom;
  final bool? centerTitle;
  final Color? foregroundColor;
  final Widget? leading;
  final double? leadingWidth;
  final Brightness? statusBarBrightness;
  final Widget? title;
  final double? titleSpacing;
  final String titleText;
  final TextStyle? titleTextStyle;

  @override
  Size get preferredSize => const Size(0, kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      title: title ?? Text(titleText),
      actions: actions,
      leading: leading,
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor: backgroundColor ,
      foregroundColor: foregroundColor ,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: backgroundColor ,
        statusBarBrightness: statusBarBrightness,
        statusBarIconBrightness: statusBarBrightness,
      ),
      centerTitle: centerTitle,
      titleTextStyle: titleTextStyle,
      leadingWidth: leadingWidth,
      titleSpacing: titleSpacing,
      bottom: bottom,
    );
  }
}
