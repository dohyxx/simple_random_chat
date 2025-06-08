import 'package:simple_random_chat/presentation/common/app_router/provider/go_router_provider.dart';
import 'package:simple_random_chat/presentation/common/app_router/route_name.dart';
import 'package:simple_random_chat/presentation/common/component/assets/icons/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:simple_random_chat/presentation/common/shared_service/menu/popup_menu_widget.dart';

class AttachMenuWidget extends StatelessWidget {
  final EdgeInsets? edgeInsets;

  const AttachMenuWidget({this.edgeInsets, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: edgeInsets ?? EdgeInsets.zero,
      child: CustomPopupMenu(
        items: [
          /// Camera
          MenuItem(
            icon: AppIcon.cameraBlack,
            onSelected: () {},
          ),

          /// Diary
          MenuItem(icon: AppIcon.diary, onSelected: () {}),

          /// File
          MenuItem(icon: AppIcon.clip, onSelected: () {}),

          /// Album
          MenuItem(
            icon: AppIcon.album,
            onSelected: () {},
          ),
        ],
      ),
    );
  }
}
