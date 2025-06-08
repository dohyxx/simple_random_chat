import 'package:simple_random_chat/domain/entity/model/chat/chat_extension.dart';
import 'package:simple_random_chat/presentation/common/app_router/provider/go_router_provider.dart';
import 'package:simple_random_chat/presentation/common/app_router/route_name.dart';
import 'package:simple_random_chat/presentation/common/component/assets/icons/app_icons.dart';
import 'package:simple_random_chat/presentation/common/component/const/app_text.dart';
import 'package:simple_random_chat/presentation/common/component/utils/util.dart';
import 'package:simple_random_chat/presentation/common/component/widgets/default/app_text_box.dart';
import 'package:simple_random_chat/presentation/common/component/widgets/default/default_app_bar.dart';
import 'package:simple_random_chat/presentation/common/component/widgets/default/default_button_event.dart';
import 'package:simple_random_chat/presentation/common/component/widgets/default/default_image_extend.dart';
import 'package:simple_random_chat/presentation/common/component/widgets/default/default_layout.dart';
import 'package:simple_random_chat/presentation/common/component/widgets/default/default_widget.dart';
import 'package:simple_random_chat/presentation/common/component/widgets/logger/logger.dart';
import 'package:simple_random_chat/presentation/chat/provider/chat_provider.dart';
import 'package:simple_random_chat/presentation/chat/provider/state/chat_state.dart';
import 'package:simple_random_chat/presentation/chat/widget/card/chat_room_card.dart';
import 'package:simple_random_chat/presentation/chat/widget/option_menu_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Chat List page
class ChatListPage extends ConsumerStatefulWidget {
  const ChatListPage({super.key});

  @override
  ConsumerState<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends ConsumerState<ChatListPage> with ChatState {
  final fabKey = GlobalKey<ExpandableFabState>();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(chatRoomListProvider);

    return DefaultLayout(
      edgeInsets: EdgeInsets.symmetric(horizontal: 25),
      appBar: DefaultAppBar(
        appBarHeight: 80,
        title: AppText.chat,
        titleSize: 20,
        actions: [
          Row(
            children: [
              /// Search
              SvgPicture.asset(AppIcon.search),

              sizedBox(width: 10),

              /// Menu
              OptionMenuWidget(),
            ],
          ),
        ],
      ),
      body: state.when(
        data: (data) {
          /// Empty List
          if (data.isEmpty) {
            return _chatEmptyWidget();
          }

          return CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.only(bottom: 80),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (_, int index) {
                      final chat = data[index];

                      return ChatRoomCard(chat);
                    },
                    childCount: data.length,
                  ),
                ),
              ),
            ],
          );
        },
        error: (err, __) => Text(err.toString()),
        loading: () => Center(child: CupertinoActivityIndicator()),
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20),
        child: ExpandableFab(
          key: fabKey,
          type: ExpandableFabType.up,
          childrenAnimation: ExpandableFabAnimation.none,
          distance: 60,
          overlayStyle: ExpandableFabOverlayStyle(color: Colors.transparent),
          openButtonBuilder: RotateFloatingActionButtonBuilder(
            child: Icon(Icons.add, size: 28, color: Color(0xff403D3C)),
            fabSize: ExpandableFabSize.small,
            backgroundColor: AppText.defaultColor(),
            shape: const CircleBorder(),
          ),
          closeButtonBuilder: FloatingActionButtonBuilder(
            size: 56,
            builder: (_, onPressed, progress) {
              return FloatingActionButton(
                highlightElevation: 20,
                foregroundColor: AppText.defaultColor(),
                disabledElevation: 20,
                hoverColor: AppText.defaultColor(),
                backgroundColor: AppText.defaultColor(),
                mini: true,
                splashColor: Colors.white24.withValues(alpha: 0.3),
                shape: CircleBorder(),
                onPressed: () => onPressed!(),
                child: Icon(Icons.close, size: 25, color: Color(0xff403D3C)),
              );
            },
          ),
          children: [
            _floatingComponent(
              title: AppText.newChat,
              onClick: () => NavigationHelper.push(RouteName.textConsultation),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    fabKey.currentState?.dispose();
  }

  Widget _floatingComponent({
    required String title,
    required void Function() onClick,
  }) {
    return DefaultBlinkButton(
      onTap: () {
        onClick();

        fabKey.currentState?.toggle();
      },
      child: Container(
        height: 43,
        width: 188,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0xff403D3C).withValues(alpha: 0.3), width: 0.2),
          boxShadow: [
            BoxShadow(
              color: Color(0xff6D6A68).withValues(alpha: 0.1),
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
        ),
        child: AppTextBox(title, 16, Color(0xff6D6A68), fontWeight: FontWeight.w700),
      ),
    );
  }
}

Widget _chatEmptyWidget() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 200),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppTextBox(
          AppText.chatEmptyMessage,
          15,
          Color(0x403D3C4D).withValues(alpha: 0.3),
          textAlign: TextAlign.center,
          fontHeight: 1.6,
        ),
      ],
    ),
  );
}
