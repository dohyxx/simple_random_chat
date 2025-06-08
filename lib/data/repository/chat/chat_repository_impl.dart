import 'package:simple_random_chat/data/data_source/local/chat/chat_data_source.dart';
import 'package:simple_random_chat/domain/entity/model/chat/chat_message.dart';
import 'package:simple_random_chat/domain/entity/model/chat/chat_room.dart';
import 'package:simple_random_chat/domain/repository/chat/chat_repository.dart';

class ChatRepositoryImpl extends ChatRepository {
  final ChatDataSource dataSource;

  ChatRepositoryImpl(this.dataSource);
  @override
  Future<List<ChatRoom>> getChatRoomList(String userId) async {
    return await dataSource.getChatRoomList(userId);
  }

  @override
  Future<String> postTemporaryChatRoom(ChatRoom chatRoom, ChatMessage message) async {
    return await dataSource.postTemporaryChatRoom(chatRoom, message);
  }

  @override
  Future<String> postChatMessage(ChatMessage chatMessage) async {
    return await dataSource.postChatMessage(chatMessage);
  }

  @override
  Stream<List<ChatMessage>> getChatMessageList(String chatRoomId) {
    return dataSource.getChatMessageList(chatRoomId);
  }

  @override
  Future<void> deleteChatRoom(String chatRoomId) async {
    return dataSource.deleteChatRoom(chatRoomId);
  }
}
