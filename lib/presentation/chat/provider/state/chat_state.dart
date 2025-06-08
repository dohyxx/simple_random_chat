import 'package:simple_random_chat/presentation/chat/provider/chat_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _textEditingController = StateProvider.autoDispose((_) => TextEditingController());
final _textLengthProvider = StateProvider.autoDispose((_) => 0);
final _deleteModeStateProvider = StateProvider.autoDispose((_) => false);

mixin class ChatState {
  final int maxCharacters = 500; // 최대 글자 수

  TextEditingController textConsultationController(WidgetRef ref) => ref.watch(_textEditingController);

  int textLength(WidgetRef ref) => ref.watch(_textLengthProvider);

  void updateTextStatus(WidgetRef ref, String input) {
    ref.read(_textLengthProvider.notifier).state = input.trim().length;
  }

  bool isDeletedMode(WidgetRef ref) => ref.watch(_deleteModeStateProvider);
  void deleteModeToggle(WidgetRef ref) {
    final state = isDeletedMode(ref);

    ref.read(_deleteModeStateProvider.notifier).state = !state;
  }

  /// 채팅방 삭제
  Future<void> deleteChatRoom(WidgetRef ref, String chatRoomId) async {
    await ref.read(chatRoomListProvider.notifier).deleteChatRoom(chatRoomId);
  }
}
