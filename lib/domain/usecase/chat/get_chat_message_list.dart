import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_random_chat/domain/entity/model/chat/chat_message.dart';
import 'package:simple_random_chat/domain/repository/chat/chat_repository.dart';

/// 채팅 Message 목록 조회
class GetChatMessageList {
  final ChatRepository repository;
  final Ref _ref;

  GetChatMessageList(
    this.repository,
    this._ref,
  );

  Stream<List<ChatMessage>> execute(String chatRoomId) {
    return repository.getChatMessageList(chatRoomId);
  }
}
