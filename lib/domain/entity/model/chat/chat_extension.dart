import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_random_chat/domain/entity/model/chat/chat_message.dart';
import 'package:simple_random_chat/domain/entity/model/chat/chat_room.dart';
import 'package:simple_random_chat/domain/entity/model/user_data.dart';
import 'package:simple_random_chat/presentation/core/user/user_provider.dart';

extension ChatRoomExtension on ChatRoom {
  ChatUserProfile opponentUser(WidgetRef ref) {
    final myId = ref.read(userProvider).userId;

    final opponentId = userIds.firstWhere((id) => id != myId, orElse: () => '');
    return users[opponentId] ?? ChatUserProfile.system();
  }

  Map<String, dynamic> toFirestoreJson() {
    return {
      'user_ids': userIds,
      'is_temporary': isTemporary,
      'last_message': lastMessage,
      'last_message_time': FieldValue.serverTimestamp(),
      'created_at': FieldValue.serverTimestamp(),
      'users': users.map((key, value) => MapEntry(key, value.toJson())),
    };
  }
}

extension ChatMessgaeExtension on ChatMessage {
  Map<String, dynamic> toFirestoreJson() {
    return {
      'sender_id': senderId,
      'message': message,
      'type': type,
      'is_read': isRead,
      'created_at': FieldValue.serverTimestamp(),
      'image_url': imageUrl,
    };
  }
}

Map<String, ChatUserProfile> buildUsersMap(UserData user) {
  return {
    user.userId: ChatUserProfile.toUserSummary(user),
  };
}
