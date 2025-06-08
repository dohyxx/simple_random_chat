import 'dart:async';
import 'package:simple_random_chat/domain/entity/model/chat/chat_message.dart';
import 'package:simple_random_chat/domain/entity/model/chat/chat_room.dart';
import 'package:simple_random_chat/infrastructure/di/chat/chat_providers.dart';
import 'package:simple_random_chat/infrastructure/network/config/result.dart';
import 'package:simple_random_chat/presentation/common/component/const/app_text.dart';
import 'package:simple_random_chat/presentation/common/component/utils/util.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_provider.g.dart';

/*
 *  Get Chat List
 */
@riverpod
class ChatRoomList extends _$ChatRoomList {
  @override
  Future<List<ChatRoom>> build() async {
    return await ref.read(getChatRoomListProvider).execute();
  }

  Future<void> deleteChatRoom(String chatRoomId) async {
    final isComplete = await ref.read(requestDeleteChatRoomProvider(chatRoomId).future);

    if (!isComplete) {
      Util.alert(AppText.errorText);
    }

    final current = state.value;
    if (current == null) return;

    state = AsyncData(current.where((chat) => chat.chatRoomId != chatRoomId).toList());
  }
}

/*
 *  Create Temporary ChatRoom
 */
@riverpod
class CreateTemporaryChatRoom extends _$CreateTemporaryChatRoom {
  @override
  Future<String> build({String? message, String? imageUrl}) async {
    return await ref.read(postTemporaryChatRoomProvider).execute(message, imageUrl);
  }
}

/*
 *  Get Chat Message
 */
@riverpod
class ChatMessageList extends _$ChatMessageList {
  StreamSubscription<List<ChatMessage>>? subscription;
  @override
  FutureOr<List<ChatMessage>> build(String chatRoomId) async {
    final stream = ref.read(getChatMessageListProvider).execute(chatRoomId);

    state = AsyncValue.data([]);

    subscription = stream.listen((newMessages) {
      final current = state.value ?? [];

      final updated = [...current];
      for (final message in newMessages) {
        final exists = updated.any((m) => m.messageId == message.messageId);

        if (!exists) {
          updated.add(message);
        }
      }

      updated.sort((a, b) => a.createdAt.compareTo(b.createdAt));

      state = AsyncValue.data(updated);
    });

    return state.value ?? [];
  }
}

/*
 *  Save Chat Message
 */
@riverpod
Future<void> sendChatMessage(Ref ref, String chatRoomId, String message) async {
  await ref.read(postChatMessageProvider).execute(chatRoomId, message);
}

/*
 *  Delete ChatRoom
 */
@riverpod
Future<bool> requestDeleteChatRoom(Ref ref, String chatRoomId) async {
  final result = await ref.read(deleteChatRoomProvider).execute(chatRoomId);

  switch (result) {
    case Success():
      return true;
    case Failure():
      return false;
  }
}
