import 'package:simple_random_chat/domain/repository/chat/chat_repository.dart';
import 'package:simple_random_chat/infrastructure/network/config/api_client.dart';
import 'package:simple_random_chat/infrastructure/network/config/result.dart';

/// 채팅방 삭제
class DeleteChatRoom {
  final ChatRepository repository;

  DeleteChatRoom(this.repository);

  Future<Result> execute(String chatRoomId) async {
    return await ApiClient.call(() => repository.deleteChatRoom(chatRoomId));
  }
}
