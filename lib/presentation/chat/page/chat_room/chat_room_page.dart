import 'package:simple_random_chat/domain/entity/model/chat/chat_extension.dart';
import 'package:simple_random_chat/domain/entity/model/chat/chat_room.dart';
import 'package:simple_random_chat/presentation/common/component/assets/icons/app_icons.dart';
import 'package:simple_random_chat/presentation/common/component/widgets/default/app_text_box.dart';
import 'package:simple_random_chat/presentation/common/component/widgets/default/default_app_bar.dart';
import 'package:simple_random_chat/presentation/common/component/widgets/default/default_image_extend.dart';
import 'package:simple_random_chat/presentation/common/component/widgets/default/default_layout.dart';
import 'package:simple_random_chat/presentation/common/component/widgets/default/default_widget.dart';
import 'package:simple_random_chat/presentation/chat/provider/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Chat Page
class ChatRoomPage extends ConsumerWidget {
  final ChatRoom chat;

  const ChatRoomPage({required this.chat, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final opponent = chat.opponentUser(ref);
    final state = ref.watch(chatMessageListProvider(chat.chatRoomId));

    return DefaultLayout(
      edgeInsets: EdgeInsets.symmetric(horizontal: 25),
      appBar: DefaultAppBar(
        horizontal: 0,
        appBarHeight: 140,
        leadingPadding: 20,
        leadingWidth: 150,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 40),
            child: SvgPicture.asset(AppIcon.menu),
          ),
        ],
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: SizedBox(
                    height: 55,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            visualDensity: VisualDensity.standard,
                            horizontalTitleGap: 10,
                            leading: ImageExtend(
                              imageUrl: opponent.imageUrl,
                              width: 50,
                              height: 50,
                              boxShape: BoxShape.circle,
                              border: Border.all(color: Color(0xff6D6A68), width: 0.6),
                            ),

                            /// Title
                            title: Row(
                              children: [
                                Expanded(
                                  child: AppTextBox('${opponent.name} 원장님', 16, Colors.black,
                                      fontWeight: FontWeight.w600, maxLines: 1),
                                ),
                              ],
                            ),

                            /// 날짜
                            subtitle: Row(
                              children: [
                                Expanded(
                                    child: AppTextBox('아트리움 치과', 12, const Color(0xFF888888),
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),

                            /// 관심
                            trailing: SvgPicture.asset(AppIcon.favorite),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                sizedBox(height: 30),
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
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: CustomScrollView(
          slivers: [
            /// TODO: 채팅 목록
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return SizedBox();
                },
                childCount: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
