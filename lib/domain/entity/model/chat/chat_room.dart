import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:simple_random_chat/domain/entity/enum/user_type.dart';
import 'package:simple_random_chat/domain/entity/model/chat/chat_extension.dart';
import 'package:simple_random_chat/domain/entity/model/user_data.dart';
import 'package:simple_random_chat/infrastructure/network/converter.dart';
import 'package:simple_random_chat/presentation/common/component/assets/icons/app_icons.dart';
import 'package:simple_random_chat/presentation/common/component/const/app_text.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_room.freezed.dart';
part 'chat_room.g.dart';

/// chat room
@freezed
class ChatRoom with _$ChatRoom {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ChatRoom({
    @Default('') final String chatRoomId,
    required final List<String> userIds,
    required final Map<String, ChatUserProfile> users,
    @Default(false) final bool isTemporary,
    @Default('') final String lastMessage,
    @TimestampConverter() required final DateTime lastMessageTime,
    @TimestampConverter() required final DateTime createdAt,
  }) = _ChatRoom;

  factory ChatRoom.parsedUserData(UserData user) {
    return ChatRoom(
      userIds: [user.userId],
      users: buildUsersMap(user),
      lastMessageTime: DateTime.now(),
      createdAt: DateTime.now(),
    );
  }

  factory ChatRoom.fromJson(Map<String, dynamic> json) => _$ChatRoomFromJson(json);
}

@freezed
class ChatUserProfile with _$ChatUserProfile {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ChatUserProfile({
    required String imageUrl,
    required String name,
    required int userType,
    @Default('') String organization,
  }) = _ChatUserProfile;

  factory ChatUserProfile.toUserSummary(UserData user) {
    return ChatUserProfile(
      imageUrl: user.profileUrl ?? '',
      name: user.name ?? '',
      userType: user.userType.key,
    );
  }

  factory ChatUserProfile.system() {
    return ChatUserProfile(
      imageUrl: AppIcon.menu,
      name: AppText.startNewChat,
      userType: UserType.guest.key,
    );
  }

  factory ChatUserProfile.fromJson(Map<String, dynamic> json) => _$ChatUserProfileFromJson(json);
}
