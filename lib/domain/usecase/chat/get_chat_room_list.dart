import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_random_chat/domain/entity/model/chat/chat_room.dart';
import 'package:simple_random_chat/domain/repository/chat/chat_repository.dart';
import 'package:simple_random_chat/infrastructure/network/config/api_client.dart';
import 'package:simple_random_chat/infrastructure/network/config/result.dart';
import 'package:simple_random_chat/presentation/common/component/widgets/logger/logger.dart';
import 'package:simple_random_chat/presentation/core/user/user_provider.dart';

/// 채팅방 목록 조회
class GetChatRoomList {
  final ChatRepository repository;
  final Ref _ref;

  GetChatRoomList(
    this.repository,
    this._ref,
  );

  Future<List<ChatRoom>> execute() async {
    final userId = _ref.read(userProvider).userId;

    final result = await ApiClient.call(() => repository.getChatRoomList(userId));

    switch (result) {
      case Success():
        return result.data;
      case Failure():
        Log.e('채팅방 목록 조회 오류');
        throw Exception(result.exception);
    }
  }
}
