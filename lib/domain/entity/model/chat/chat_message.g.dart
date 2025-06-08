// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatMessageImpl _$$ChatMessageImplFromJson(Map<String, dynamic> json) =>
    _$ChatMessageImpl(
      senderId: json['sender_id'] as String,
      message: json['message'] as String,
      messageId: json['message_id'] as String? ?? '',
      chatRoomId: json['chat_room_id'] as String? ?? '',
      type: json['type'] as String? ?? 'text',
      isRead: json['is_read'] as bool? ?? false,
      createdAt:
          const TimestampConverter().fromJson(json['created_at'] as Timestamp),
      imageUrl: json['image_url'] as String?,
    );

Map<String, dynamic> _$$ChatMessageImplToJson(_$ChatMessageImpl instance) =>
    <String, dynamic>{
      'sender_id': instance.senderId,
      'message': instance.message,
      'message_id': instance.messageId,
      'chat_room_id': instance.chatRoomId,
      'type': instance.type,
      'is_read': instance.isRead,
      'created_at': const TimestampConverter().toJson(instance.createdAt),
      'image_url': instance.imageUrl,
    };
