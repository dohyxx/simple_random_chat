import 'package:simple_random_chat/domain/entity/enum/message_type.dart';
import 'package:simple_random_chat/domain/entity/model/chat/chat_message.dart';
import 'package:simple_random_chat/domain/entity/model/chat/chat_room.dart';
import 'package:simple_random_chat/domain/repository/chat/chat_repository.dart';
import 'package:simple_random_chat/infrastructure/network/config/api_client.dart';
import 'package:simple_random_chat/infrastructure/network/config/result.dart';
import 'package:simple_random_chat/presentation/common/component/const/app_text.dart';
import 'package:simple_random_chat/presentation/common/component/widgets/logger/logger.dart';
import 'package:simple_random_chat/presentation/core/user/user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 임시 채팅방 생성
class PostTemporaryChatRoom {
  final ChatRepository repository;
  final Ref _ref;

  PostTemporaryChatRoom(
    this.repository,
    this._ref,
  );

  Future<String> execute(String? message, String? imageUrl) async {
    final user = _ref.read(userProvider);

    final data = ChatRoom.parsedUserData(user).copyWith(
      isTemporary: true,
      lastMessage: AppText.startNewChat,
    );

    final chatMessage = ChatMessage(
      senderId: user.userId,
      message: message ?? AppText.startNewChat,
      createdAt: DateTime.now(),
      type: message == null ? MessageType.system.name : MessageType.text.name,
      imageUrl: imageUrl,
    );

    final result = await ApiClient.call(() => repository.postTemporaryChatRoom(data, chatMessage));

    switch (result) {
      case Success():
        return result.data;

      case Failure():
        Log.e('채팅방 생성 오류');
        throw Exception(result.exception);
    }
  }
}
