import 'package:simple_random_chat/domain/entity/model/chat/chat_message.dart';
import 'package:simple_random_chat/domain/entity/model/chat/chat_room.dart';

abstract class ChatRepository {
  Future<List<ChatRoom>> getChatRoomList(String userId);

  Future<String> postTemporaryChatRoom(ChatRoom chatRoom, ChatMessage message);

  Stream<List<ChatMessage>> getChatMessageList(String chatRoomId);

  Future<String> postChatMessage(ChatMessage chatMessage);

  Future<void> deleteChatRoom(String chatRoomId);
}
