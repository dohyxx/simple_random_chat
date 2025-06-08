import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:simple_random_chat/domain/entity/model/chat/chat_extension.dart';
import 'package:simple_random_chat/domain/entity/model/chat/chat_message.dart';
import 'package:simple_random_chat/domain/entity/model/chat/chat_room.dart';
import 'package:simple_random_chat/infrastructure/network/firebase/app_collection.dart';
import 'package:simple_random_chat/presentation/core/settings/firebase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatDataSource {
  final Ref ref;

  ChatDataSource(this.ref);

  /*
   * Get Chat List
   */
  Future<List<ChatRoom>> getChatRoomList(String userId) async {
    final querySnapshot = await ref
        .read(cloudFirestoreProvider)
        .collection(AppCollection.chats)
        .where('user_ids', arrayContains: userId)
        .orderBy('last_message_time', descending: true)
        .get();

    return querySnapshot.docs.map((doc) {
      return ChatRoom.fromJson(doc.data()).copyWith(chatRoomId: doc.id);
    }).toList();
  }

  /*
   * Get Chat Message List
   */
  Stream<List<ChatMessage>> getChatMessageList(String chatRoomId) {
    return ref
        .read(cloudFirestoreProvider)
        .collection(AppCollection.chats)
        .doc(chatRoomId)
        .collection(AppCollection.messages)
        .orderBy('created_at', descending: false)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return ChatMessage.fromJson(doc.data()).copyWith(messageId: doc.id);
      }).toList();
    });
  }

  /*
   * Create Temporary ChatRoom
   */
  Future<String> postTemporaryChatRoom(ChatRoom chatRoom, ChatMessage message) async {
    final systemMessage = [message, ChatMessage.template()];
    final chatRoomRef = ref.read(cloudFirestoreProvider).collection(AppCollection.chats).doc();

    await chatRoomRef.set(chatRoom.toFirestoreJson());

    await Future.wait(systemMessage.map((message) {
      return chatRoomRef.collection(AppCollection.messages).add(message.toFirestoreJson());
    }));

    return chatRoomRef.id;
  }

  /*
   * Save Chat Message
   */
  Future<String> postChatMessage(ChatMessage message) async {
    final chatMessageRef = ref
        .read(cloudFirestoreProvider)
        .collection(AppCollection.chats)
        .doc(message.chatRoomId)
        .collection(AppCollection.messages)
        .doc();

    await chatMessageRef.set(message.toFirestoreJson());

    await ref.read(cloudFirestoreProvider).collection(AppCollection.chats).doc(message.chatRoomId).update({
      'last_message': message.message,
      'last_message_time': FieldValue.serverTimestamp(),
    });

    return chatMessageRef.id;
  }

  /*
   * Delete ChatRoom
   */
  Future<void> deleteChatRoom(String chatRoomId) async {
    await ref.read(cloudFirestoreProvider).collection(AppCollection.chats).doc(chatRoomId).delete();
  }
}
