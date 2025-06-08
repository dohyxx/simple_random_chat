import 'package:simple_random_chat/presentation/common/component/assets/icons/app_icons.dart';
import 'package:simple_random_chat/presentation/common/component/const/app_text.dart';
import 'package:simple_random_chat/presentation/common/component/widgets/default/app_text_box.dart';
import 'package:simple_random_chat/presentation/common/component/widgets/default/default_button_event.dart';
import 'package:simple_random_chat/presentation/chat/provider/state/chat_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OptionMenuWidget extends ConsumerStatefulWidget {
  const OptionMenuWidget({super.key});

  @override
  ConsumerState<OptionMenuWidget> createState() => _OptionMenuWidgetState();
}

class _OptionMenuWidgetState extends ConsumerState<OptionMenuWidget> with ChatState {
  OverlayEntry? _overlayEntry;

  void _showMenu(BuildContext context) {
    final renderBox = context.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder: (_) => Stack(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: _hideMenu,
            child: Container(
              color: Colors.transparent,
            ),
          ),
          Positioned(
            top: position.dy + 35,
            right: 20,
            child: Material(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  /// 편집하기
                  _menuItem(
                    title: isDeletedMode(ref) ? AppText.editComplete : AppText.edit,
                    onTap: () {
                      _hideMenu();

                      deleteModeToggle(ref);
                    },
                  ),
                  SizedBox(height: 8),

                  /// 정렬하기
                  _menuItem(
                      title: AppText.sort,
                      onTap: () {
                        _hideMenu();

                        //
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideMenu() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  Widget _menuItem({required String title, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: AppTextBox(title, 15, Color(0xff6D6A68)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultBlinkButton(
      onTap: () {
        if (_overlayEntry != null) {
          _hideMenu();
        } else {
          _showMenu(context);
        }
      },
      child: SvgPicture.asset(AppIcon.menu),
    );
  }

  @override
  void dispose() {
    super.dispose();

    _hideMenu();
  }
}
