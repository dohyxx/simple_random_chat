import 'package:simple_random_chat/domain/entity/model/chat/chat_extension.dart';
import 'package:simple_random_chat/domain/entity/model/chat/chat_room.dart';
import 'package:simple_random_chat/presentation/common/app_router/provider/go_router_provider.dart';
import 'package:simple_random_chat/presentation/common/app_router/route_name.dart';
import 'package:simple_random_chat/presentation/common/component/assets/icons/app_icons.dart';
import 'package:simple_random_chat/presentation/common/component/const/app_text.dart';
import 'package:simple_random_chat/presentation/common/component/utils/util.dart';
import 'package:simple_random_chat/presentation/common/component/widgets/default/app_text_box.dart';
import 'package:simple_random_chat/presentation/common/component/widgets/default/default_button_event.dart';
import 'package:simple_random_chat/presentation/common/component/widgets/default/default_image_extend.dart';
import 'package:simple_random_chat/presentation/common/component/widgets/default/default_widget.dart';
import 'package:simple_random_chat/presentation/chat/provider/state/chat_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatRoomCard extends ConsumerWidget with ChatState {
  final ChatRoom chat;

  ChatRoomCard(
    this.chat, {
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final opponentUser = chat.opponentUser(ref);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: DefaultBlinkButton(
        onTap: () {
          chat.isTemporary
              ? NavigationHelper.push(RouteName.temporaryChatRoom, extra: chat)
              : NavigationHelper.push(RouteName.chatList, extra: chat);
        },
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (chat.isTemporary)
                  Container(
                    padding: EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Color(0xffF4EDE5).withValues(alpha: 0.8),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.account_circle_sharp, color: Colors.black),
                  )
                else
                  ImageExtend(
                    imageUrl: opponentUser.imageUrl,
                    width: 50,
                    height: 50,
                    boxShape: BoxShape.circle,
                    border: Border.all(color: Color(0xff6D6A68), width: 0.6),
                  ),
                sizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          /// name
                          AppTextBox(
                            opponentUser.name,
                            14,
                            Color(0xff6D6A68),
                            fontWeight: FontWeight.w700,
                          ),

                          Spacer(),

                          /// 삭제 버튼
                          if (isDeletedMode(ref))
                            DefaultBlinkButton(
                              onTap: () {
                                Util.alert(
                                  AppText.chatExitConfirmMessage,
                                  onClick: () async => await deleteChatRoom(ref, chat.chatRoomId),
                                  okButtonName: '나가기',
                                  isCancelButton: true,
                                );
                              },
                              minSize: 15,
                              child: SvgPicture.asset(
                                AppIcon.cancel,
                                height: 17,
                                width: 17,
                                colorFilter: const ColorFilter.mode(Color(0xffFF6C6C), BlendMode.srcIn),
                              ),
                            ),
                        ],
                      ),
                      sizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: AppTextBox(
                              chat.lastMessage,
                              12,
                              Color(0xff6D6A68),
                              maxLines: 1,
                              textOverflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: AppTextBox(
                              Util.formatChatTime(chat.lastMessageTime),
                              12,
                              Color(0xff6D6A68),
                            ),
                          ),
                        ],
                      ),
                      sizedBox(height: 20),
                      lineBorder(height: 0.2, color: Color(0xff6D6A68)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
