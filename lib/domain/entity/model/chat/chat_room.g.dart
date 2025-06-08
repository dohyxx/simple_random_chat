// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatRoomImpl _$$ChatRoomImplFromJson(Map<String, dynamic> json) =>
    _$ChatRoomImpl(
      chatRoomId: json['chat_room_id'] as String? ?? '',
      userIds:
          (json['user_ids'] as List<dynamic>).map((e) => e as String).toList(),
      users: (json['users'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, ChatUserProfile.fromJson(e as Map<String, dynamic>)),
      ),
      isTemporary: json['is_temporary'] as bool? ?? false,
      lastMessage: json['last_message'] as String? ?? '',
      lastMessageTime: const TimestampConverter()
          .fromJson(json['last_message_time'] as Timestamp),
      createdAt:
          const TimestampConverter().fromJson(json['created_at'] as Timestamp),
    );

Map<String, dynamic> _$$ChatRoomImplToJson(_$ChatRoomImpl instance) =>
    <String, dynamic>{
      'chat_room_id': instance.chatRoomId,
      'user_ids': instance.userIds,
      'users': instance.users,
      'is_temporary': instance.isTemporary,
      'last_message': instance.lastMessage,
      'last_message_time':
          const TimestampConverter().toJson(instance.lastMessageTime),
      'created_at': const TimestampConverter().toJson(instance.createdAt),
    };

_$ChatUserProfileImpl _$$ChatUserProfileImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatUserProfileImpl(
      imageUrl: json['image_url'] as String,
      name: json['name'] as String,
      userType: (json['user_type'] as num).toInt(),
      organization: json['organization'] as String? ?? '',
    );

Map<String, dynamic> _$$ChatUserProfileImplToJson(
        _$ChatUserProfileImpl instance) =>
    <String, dynamic>{
      'image_url': instance.imageUrl,
      'name': instance.name,
      'user_type': instance.userType,
      'organization': instance.organization,
    };
