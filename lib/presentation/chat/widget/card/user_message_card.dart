import 'package:simple_random_chat/domain/entity/enum/message_type.dart';
import 'package:simple_random_chat/domain/entity/model/chat/chat_message.dart';
import 'package:simple_random_chat/presentation/common/app_router/provider/go_router_provider.dart';
import 'package:simple_random_chat/presentation/common/app_router/route_name.dart';
import 'package:simple_random_chat/presentation/common/component/utils/util.dart';
import 'package:simple_random_chat/presentation/common/component/widgets/default/app_text_box.dart';
import 'package:simple_random_chat/presentation/common/component/widgets/default/default_button_event.dart';
import 'package:simple_random_chat/presentation/core/user/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserMessageCard extends StatelessWidget {
  final ChatMessage chat;
  const UserMessageCard({required this.chat, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 6, bottom: 8),
            child: AppTextBox(Util.formatChatTime(chat.createdAt), 10, Color(0xff222222)),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            child: Container(
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                  color: Color(0xff403D3C),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15))),
              child: AppTextBox(
                chat.message,
                15,
                Color(0xffFFFFFF),
                textOverflow: TextOverflow.visible,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
