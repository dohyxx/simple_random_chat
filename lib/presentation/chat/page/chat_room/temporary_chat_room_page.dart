import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:simple_random_chat/domain/entity/model/chat/chat_room.dart';
import 'package:simple_random_chat/presentation/chat/provider/chat_provider.dart';
import 'package:simple_random_chat/presentation/chat/widget/attach_menu_widget.dart';
import 'package:simple_random_chat/presentation/chat/widget/card/opponent_message_card.dart';
import 'package:simple_random_chat/presentation/chat/widget/card/user_message_card.dart';
import 'package:simple_random_chat/presentation/common/component/assets/icons/app_icons.dart';
import 'package:simple_random_chat/presentation/common/component/assets/lottie_files/app_lottie.dart';
import 'package:simple_random_chat/presentation/common/component/const/app_text.dart';
import 'package:simple_random_chat/presentation/common/component/widgets/default/default_app_bar.dart';
import 'package:simple_random_chat/presentation/common/component/widgets/default/default_button_event.dart';
import 'package:simple_random_chat/presentation/common/component/widgets/default/default_layout.dart';
import 'package:simple_random_chat/presentation/common/component/widgets/default/default_text_field.dart';
import 'package:simple_random_chat/presentation/common/component/widgets/default/default_widget.dart';
import 'package:simple_random_chat/presentation/common/component/widgets/default/size_config.dart';
import 'package:simple_random_chat/presentation/common/component/widgets/logger/logger.dart';
import 'package:simple_random_chat/presentation/common/shared_service/menu/popup_menu_widget.dart';
import 'package:simple_random_chat/presentation/core/user/user_provider.dart';

class TemporaryChatRoomPage extends ConsumerStatefulWidget {
  final ChatRoom chat;

  const TemporaryChatRoomPage({required this.chat, super.key});

  @override
  ConsumerState<TemporaryChatRoomPage> createState() => _TemporaryChatRoomPageState();
}

class _TemporaryChatRoomPageState extends ConsumerState<TemporaryChatRoomPage> {
  final textController = TextEditingController();
  final scrollController = ScrollController();
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final isShowMenu = ref.watch(popupMenuProvider);
    final state = ref.watch(chatMessageListProvider(widget.chat.chatRoomId));
    final currentId = ref.read(userProvider).userId;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    });

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: DefaultLayout(
        resizeToAvoidBottomInset: true,
        appBar: _chatAppBar(),
        body: Column(
          children: [
            /// Chat Message List
            state.when(
              data: (data) {
                return Expanded(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: ListView.separated(
                      shrinkWrap: true,
                      controller: scrollController,
                      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 24),
                      separatorBuilder: (_, __) => sizedBox(height: 12),
                      itemCount: data.length,
                      itemBuilder: (_, index) {
                        final message = data[index];

                        return data[index].senderId == currentId
                            ? UserMessageCard(chat: message)
                            : OpponentMessageCard(chat: message);
                      },
                    ),
                  ),
                );
              },
              error: (e, __) => Text(e.toString()),
              loading: () => Center(child: CupertinoActivityIndicator()),
            ),

            /// Message Text Field
            SafeArea(
              maintainBottomViewPadding: true,
              bottom: true,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    /// Attach Menu
                    if (isShowMenu)
                      AttachMenuWidget(
                        edgeInsets: const EdgeInsets.only(bottom: 12),
                      ),

                    Container(
                      constraints: const BoxConstraints(minHeight: 50),
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
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                /// Plus Button
                                DefaultBlinkButton(
                                  onTap: () {
                                    ref.read(popupMenuProvider.notifier).state = !isShowMenu;
                                  },
                                  child: isShowMenu
                                      ? SvgPicture.asset(AppIcon.cancelCircle)
                                      : SvgPicture.asset(AppIcon.chatPlus),
                                ),

                                /// Input Text
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: SizedBox(
                                    width: SizeConfig.screenWidth * 0.55,
                                    child: DefaultTextField(
                                      controller: textController,
                                      textColor: Color(0xff222222),
                                      focusNode: focusNode,
                                      hintText: AppText.inputMessage,
                                      fontSize: 15,
                                      hintTextSize: 13,
                                      textInputAction: TextInputAction.newline,
                                      onTap: () {
                                        Log.d('message');
                                        final isOver = state.hasValue ? state.value!.length >= 6 : false;

                                        if (!focusNode.hasFocus && isOver) {
                                          scrollController.animateTo(
                                            scrollController.position.maxScrollExtent + 250,
                                            duration: Duration(milliseconds: 400),
                                            curve: Curves.ease,
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            /// Send Message
                            DefaultBlinkButton(
                              onTap: () async {
                                final message = textController.text.trim();

                                if (message.isEmpty) return;

                                await ref
                                    .read(sendChatMessageProvider(widget.chat.chatRoomId, message).future);

                                textController.clear();
                              },
                              child: SvgPicture.asset(AppIcon.sendMessage),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();

    focusNode.dispose();
    textController.dispose();
  }
}

/// App Bar
PreferredSizeWidget _chatAppBar() {
  return DefaultAppBar(
    horizontal: 0,
    appBarHeight: 120,
    leadingWidth: 120,
    leadingPadding: 20,
    actions: [
      DefaultBlinkButton(
        onTap: () {
          //
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 30),
          child: SvgPicture.asset(AppIcon.menu),
        ),
      ),
    ],
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(100),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25, bottom: 16),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Color(0xffF4EDE5),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.account_circle_sharp, color: Colors.black),
                ),
                Transform.scale(
                  scale: 2.7,
                  child: SizedBox(
                    width: 70,
                    height: 40,
                    child: Lottie.asset(
                      AppLottie.loading,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  color: Color(0x403D3C4D).withValues(alpha: 0.1),
                  width: 1,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0x0000001A).withValues(alpha: 0.1),
                  offset: Offset(0, 4),
                  blurRadius: 10,
                  spreadRadius: 3,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
