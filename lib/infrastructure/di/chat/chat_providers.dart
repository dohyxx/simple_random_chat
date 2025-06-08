import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simple_random_chat/data/data_source/local/chat/chat_data_source.dart';
import 'package:simple_random_chat/data/repository/chat/chat_repository_impl.dart';
import 'package:simple_random_chat/domain/repository/chat/chat_repository.dart';
import 'package:simple_random_chat/domain/usecase/chat/delete_chat_room.dart';
import 'package:simple_random_chat/domain/usecase/chat/get_chat_message_list.dart';
import 'package:simple_random_chat/domain/usecase/chat/get_chat_room_list.dart';
import 'package:simple_random_chat/domain/usecase/chat/post_chat_message.dart';
import 'package:simple_random_chat/domain/usecase/chat/post_temporary_chat_room.dart';

part 'chat_providers.g.dart';

/// Chat data source
@riverpod
ChatDataSource chatDataSource(Ref ref) {
  return ChatDataSource(ref);
}

/// Chat repository
@riverpod
ChatRepository chatRepository(Ref ref) {
  return ChatRepositoryImpl(ref.watch(chatDataSourceProvider));
}

/// Chat usecase
@riverpod
GetChatRoomList getChatRoomList(Ref ref) {
  return GetChatRoomList(ref.watch(chatRepositoryProvider), ref);
}

@riverpod
PostTemporaryChatRoom postTemporaryChatRoom(Ref ref) {
  return PostTemporaryChatRoom(ref.watch(chatRepositoryProvider), ref);
}

@riverpod
GetChatMessageList getChatMessageList(Ref ref) {
  return GetChatMessageList(ref.watch(chatRepositoryProvider), ref);
}

@riverpod
PostChatMessage postChatMessage(Ref ref) {
  return PostChatMessage(ref.watch(chatRepositoryProvider), ref);
}

@riverpod
DeleteChatRoom deleteChatRoom(Ref ref) {
  return DeleteChatRoom(ref.watch(chatRepositoryProvider));
}
