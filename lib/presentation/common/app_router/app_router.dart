import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_random_chat/domain/entity/model/chat/chat_room.dart';
import 'package:simple_random_chat/presentation/chat/page/chat_list_page.dart';
import 'package:simple_random_chat/presentation/chat/page/chat_room/chat_room_page.dart';
import 'package:simple_random_chat/presentation/chat/page/chat_room/temporary_chat_room_page.dart';
import 'package:simple_random_chat/presentation/chat/page/text_consultation_page.dart';
import 'package:simple_random_chat/presentation/common/app_router/route_name.dart';
import 'package:simple_random_chat/presentation/home/page/home_page.dart';

class GlobalNavigator {
  static final GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();
}

final _shellNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static final routes = [
    /// Home
    GoRoute(path: RouteName.home, pageBuilder: (_, state) => const NoTransitionPage(child: HomePage())),

    /// Chat
    GoRoute(path: RouteName.chatList, builder: (_, state) => const ChatListPage()),

    GoRoute(path: RouteName.chatRoom, builder: (_, state) => ChatRoomPage(chat: state.extra as ChatRoom)),

    GoRoute(
        path: RouteName.temporaryChatRoom,
        builder: (_, state) => TemporaryChatRoomPage(chat: state.extra as ChatRoom)),

    GoRoute(path: RouteName.textConsultation, builder: (_, state) => TextConsultationPage()),
  ];
}
