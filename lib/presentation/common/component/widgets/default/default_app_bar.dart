import 'package:simple_random_chat/presentation/common/app_router/provider/go_router_provider.dart';
import 'package:simple_random_chat/presentation/common/component/assets/icons/app_icons.dart';
import 'package:simple_random_chat/presentation/common/component/widgets/default/app_text_box.dart';
import 'package:simple_random_chat/presentation/common/component/widgets/default/default_button_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final String? title;
  final double? titleSize;
  final FontWeight? titleFontWeight;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final double leadingWidth;
  final PreferredSize? bottom;
  final double? horizontal;
  final double appBarHeight;
  final double leadingPadding;

  const DefaultAppBar({
    this.leading,
    this.title,
    this.titleSize = 14,
    this.titleFontWeight = FontWeight.w500,
    this.actions,
    this.backgroundColor = const Color(0xffFFFFFF),
    this.leadingWidth = 48,
    this.bottom,
    this.horizontal = 20,
    this.appBarHeight = 60,
    this.leadingPadding = 0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal ?? 20),
      child: AppBar(
        backgroundColor: backgroundColor,
        centerTitle: true,
        elevation: 0,
        leadingWidth: leadingWidth,
        titleSpacing: 0,
        leading: leading ?? defaultLeading(leftPadding: leadingPadding),
        title: AppTextBox(title ?? '', titleSize ?? 20, const Color(0xff222222),
            fontWeight: titleFontWeight ?? FontWeight.w700),
        actions: actions,
        scrolledUnderElevation: 0,
        bottom: bottom,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}

Widget defaultLeading({
  String? iconPath,
  Function? onTap,
  double leftPadding = 0,
}) {
  return DefaultBlinkButton(
    onTap: () {
      NavigationHelper.pop();

      if (onTap != null) {
        onTap();
      }
    },
    child: Padding(
      padding: EdgeInsets.only(left: leftPadding),
      child: Row(
        children: [
          SvgPicture.asset(AppIcon.arrowBack),
        ],
      ),
    ),
  );
}
