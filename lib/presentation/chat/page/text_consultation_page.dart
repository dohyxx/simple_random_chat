import 'package:simple_random_chat/presentation/common/app_router/provider/go_router_provider.dart';
import 'package:simple_random_chat/presentation/common/app_router/route_name.dart';
import 'package:simple_random_chat/presentation/common/component/assets/icons/app_icons.dart';
import 'package:simple_random_chat/presentation/common/component/const/app_text.dart';
import 'package:simple_random_chat/presentation/common/component/widgets/default/app_text_box.dart';
import 'package:simple_random_chat/presentation/common/component/widgets/default/default_app_bar.dart';
import 'package:simple_random_chat/presentation/common/component/widgets/default/default_button_event.dart';
import 'package:simple_random_chat/presentation/common/component/widgets/default/default_layout.dart';
import 'package:simple_random_chat/presentation/common/component/widgets/default/default_text_field.dart';
import 'package:simple_random_chat/presentation/common/component/widgets/default/size_config.dart';
import 'package:simple_random_chat/presentation/common/component/widgets/tooltip_with_button.dart';
import 'package:simple_random_chat/presentation/common/shared_service/menu/popup_menu_widget.dart';
import 'package:simple_random_chat/presentation/chat/provider/chat_provider.dart';
import 'package:simple_random_chat/presentation/chat/provider/state/chat_state.dart';
import 'package:simple_random_chat/presentation/chat/widget/attach_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextConsultationPage extends ConsumerStatefulWidget {
  const TextConsultationPage({super.key});

  @override
  ConsumerState<TextConsultationPage> createState() => _TextConsultationPageState();
}

class _TextConsultationPageState extends ConsumerState<TextConsultationPage> with ChatState {
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final isShowMenu = ref.watch(popupMenuProvider);
    final controller = textConsultationController(ref);

    return DefaultLayout(
      appBar: DefaultAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(flex: 2),

          Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: AppTextBox(AppText.inputMessage, 20, Color(0xff6D6A68)),
              ),
              if (isShowMenu)
                AttachMenuWidget(
                  edgeInsets: const EdgeInsets.symmetric(horizontal: 20),
                ),
            ],
          ),

          /// Message Text Field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xffFFFFFF),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Color(0x0000001A), width: 0.1),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff6D6A68).withValues(alpha: 0.1),
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 0),
                child: Stack(
                  children: [
                    Row(
                      children: [
                        DefaultBlinkButton(
                          onTap: () {
                            ref.read(popupMenuProvider.notifier).state = !isShowMenu;
                          },
                          child: SvgPicture.asset(
                            isShowMenu ? AppIcon.cancelCircle : AppIcon.chatPlus,
                            colorFilter: const ColorFilter.mode(
                              Color(0xff6D6A68),
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: SizedBox(
                            width: SizeConfig.screenWidth * 0.5,
                            child: DefaultTextField(
                              controller: controller,
                              textColor: Color(0xff6D6A68),
                              focusNode: focusNode,
                              hintText: "(0 / $maxCharacters)",
                              hintTextSize: 12,
                              textInputAction: TextInputAction.newline,
                              onChanged: (input) {
                                updateTextStatus(ref, input);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (textLength(ref) >= 1)
                      Positioned(
                        bottom: 5,
                        right: 0,
                        child: AppTextBox("(${textLength(ref)} / $maxCharacters)", 12, Color(0xff6D6A68)),
                      ),
                  ],
                ),
              ),
            ),
          ),
          Spacer(flex: 3),

          /// Create ChatRoom
          TooltipWithButton(
            tooltipMessage: AppText.pleasePressButton,
            buttonName: AppText.newChat,
            isSelected: controller.text.trim().isNotEmpty,
            onTap: () async {
              final message = controller.text.trim();

              if (message.isEmpty) return;

              await ref.read(createTemporaryChatRoomProvider(message: message).future);

              NavigationHelper.pushReplacement(RouteName.chatList);
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();

    focusNode.dispose();
  }
}
