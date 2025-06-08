import 'package:simple_random_chat/domain/entity/model/chat/chat_message.dart';
import 'package:simple_random_chat/presentation/common/component/utils/util.dart';
import 'package:simple_random_chat/presentation/common/component/widgets/default/app_text_box.dart';
import 'package:flutter/material.dart';

class OpponentMessageCard extends StatelessWidget {
  final ChatMessage chat;
  const OpponentMessageCard({required this.chat, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.73,
            ),
            child: Container(
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                  color: Color(0xffF4EDE5).withValues(alpha: 0.3),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15))),
              child: AppTextBox(
                chat.message,
                15,
                Color(0xff6D6A68),
                textOverflow: TextOverflow.visible,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6, bottom: 8),
            child: AppTextBox(Util.formatChatTime(chat.createdAt), 10, Color(0xff222222)),
          ),
        ],
      ),
    );
  }
}
