import 'package:simple_random_chat/domain/entity/model/chat/chat_message.dart';
import 'package:simple_random_chat/domain/repository/chat/chat_repository.dart';
import 'package:simple_random_chat/infrastructure/network/config/api_client.dart';
import 'package:simple_random_chat/infrastructure/network/config/result.dart';
import 'package:simple_random_chat/presentation/common/component/widgets/logger/logger.dart';
import 'package:simple_random_chat/presentation/core/user/user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 채팅 Message 저장
class PostChatMessage {
  final ChatRepository repository;
  final Ref _ref;

  PostChatMessage(
    this.repository,
    this._ref,
  );

  Future<String> execute(String chatRoomId, String message) async {
    final user = _ref.read(userProvider);

    final data = ChatMessage(
      chatRoomId: chatRoomId,
      senderId: user.userId,
      message: message,
      type: 'text',
      isRead: false,
      createdAt: DateTime.now(),
    );

    final result = await ApiClient.call(() => repository.postChatMessage(data));

    switch (result) {
      case Success():
        return result.data;

      case Failure():
        Log.e('채팅 Message 저장 오류');
        throw Exception(result.exception);
    }
  }
}
