import 'package:simple_random_chat/infrastructure/network/converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'chat_message.freezed.dart';
part 'chat_message.g.dart';

@Freezed(fromJson: true)
class ChatMessage with _$ChatMessage {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ChatMessage({
    required final String senderId,
    required final String message,
    @Default('') final String messageId,
    @Default('') final String chatRoomId,
    @Default('text') final String type,
    @Default(false) final bool isRead,
    @TimestampConverter() required final DateTime createdAt,
    final String? imageUrl,
  }) = _ChatMessage;

  factory ChatMessage.template() {
    return ChatMessage(
      message: '현재 매칭 상대를 찾고 있습니다.\n조금만 기다려주세요!',
      senderId: 'system',
      type: 'text',
      isRead: false,
      createdAt: DateTime.now(),
    );
  }

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    if (json['created_at'] == null) {
      json['created_at'] = Timestamp.now();
    }

    final data = _$ChatMessageFromJson(json);

    return data;
  }
}
