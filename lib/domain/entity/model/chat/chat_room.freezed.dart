// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_room.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatRoom _$ChatRoomFromJson(Map<String, dynamic> json) {
  return _ChatRoom.fromJson(json);
}

/// @nodoc
mixin _$ChatRoom {
  String get chatRoomId => throw _privateConstructorUsedError;
  List<String> get userIds => throw _privateConstructorUsedError;
  Map<String, ChatUserProfile> get users => throw _privateConstructorUsedError;
  bool get isTemporary => throw _privateConstructorUsedError;
  String get lastMessage => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get lastMessageTime => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this ChatRoom to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatRoom
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatRoomCopyWith<ChatRoom> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRoomCopyWith<$Res> {
  factory $ChatRoomCopyWith(ChatRoom value, $Res Function(ChatRoom) then) =
      _$ChatRoomCopyWithImpl<$Res, ChatRoom>;
  @useResult
  $Res call(
      {String chatRoomId,
      List<String> userIds,
      Map<String, ChatUserProfile> users,
      bool isTemporary,
      String lastMessage,
      @TimestampConverter() DateTime lastMessageTime,
      @TimestampConverter() DateTime createdAt});
}

/// @nodoc
class _$ChatRoomCopyWithImpl<$Res, $Val extends ChatRoom>
    implements $ChatRoomCopyWith<$Res> {
  _$ChatRoomCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatRoom
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatRoomId = null,
    Object? userIds = null,
    Object? users = null,
    Object? isTemporary = null,
    Object? lastMessage = null,
    Object? lastMessageTime = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      chatRoomId: null == chatRoomId
          ? _value.chatRoomId
          : chatRoomId // ignore: cast_nullable_to_non_nullable
              as String,
      userIds: null == userIds
          ? _value.userIds
          : userIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as Map<String, ChatUserProfile>,
      isTemporary: null == isTemporary
          ? _value.isTemporary
          : isTemporary // ignore: cast_nullable_to_non_nullable
              as bool,
      lastMessage: null == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String,
      lastMessageTime: null == lastMessageTime
          ? _value.lastMessageTime
          : lastMessageTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatRoomImplCopyWith<$Res>
    implements $ChatRoomCopyWith<$Res> {
  factory _$$ChatRoomImplCopyWith(
          _$ChatRoomImpl value, $Res Function(_$ChatRoomImpl) then) =
      __$$ChatRoomImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String chatRoomId,
      List<String> userIds,
      Map<String, ChatUserProfile> users,
      bool isTemporary,
      String lastMessage,
      @TimestampConverter() DateTime lastMessageTime,
      @TimestampConverter() DateTime createdAt});
}

/// @nodoc
class __$$ChatRoomImplCopyWithImpl<$Res>
    extends _$ChatRoomCopyWithImpl<$Res, _$ChatRoomImpl>
    implements _$$ChatRoomImplCopyWith<$Res> {
  __$$ChatRoomImplCopyWithImpl(
      _$ChatRoomImpl _value, $Res Function(_$ChatRoomImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatRoom
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatRoomId = null,
    Object? userIds = null,
    Object? users = null,
    Object? isTemporary = null,
    Object? lastMessage = null,
    Object? lastMessageTime = null,
    Object? createdAt = null,
  }) {
    return _then(_$ChatRoomImpl(
      chatRoomId: null == chatRoomId
          ? _value.chatRoomId
          : chatRoomId // ignore: cast_nullable_to_non_nullable
              as String,
      userIds: null == userIds
          ? _value._userIds
          : userIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as Map<String, ChatUserProfile>,
      isTemporary: null == isTemporary
          ? _value.isTemporary
          : isTemporary // ignore: cast_nullable_to_non_nullable
              as bool,
      lastMessage: null == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String,
      lastMessageTime: null == lastMessageTime
          ? _value.lastMessageTime
          : lastMessageTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$ChatRoomImpl implements _ChatRoom {
  const _$ChatRoomImpl(
      {this.chatRoomId = '',
      required final List<String> userIds,
      required final Map<String, ChatUserProfile> users,
      this.isTemporary = false,
      this.lastMessage = '',
      @TimestampConverter() required this.lastMessageTime,
      @TimestampConverter() required this.createdAt})
      : _userIds = userIds,
        _users = users;

  factory _$ChatRoomImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatRoomImplFromJson(json);

  @override
  @JsonKey()
  final String chatRoomId;
  final List<String> _userIds;
  @override
  List<String> get userIds {
    if (_userIds is EqualUnmodifiableListView) return _userIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userIds);
  }

  final Map<String, ChatUserProfile> _users;
  @override
  Map<String, ChatUserProfile> get users {
    if (_users is EqualUnmodifiableMapView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_users);
  }

  @override
  @JsonKey()
  final bool isTemporary;
  @override
  @JsonKey()
  final String lastMessage;
  @override
  @TimestampConverter()
  final DateTime lastMessageTime;
  @override
  @TimestampConverter()
  final DateTime createdAt;

  @override
  String toString() {
    return 'ChatRoom(chatRoomId: $chatRoomId, userIds: $userIds, users: $users, isTemporary: $isTemporary, lastMessage: $lastMessage, lastMessageTime: $lastMessageTime, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatRoomImpl &&
            (identical(other.chatRoomId, chatRoomId) ||
                other.chatRoomId == chatRoomId) &&
            const DeepCollectionEquality().equals(other._userIds, _userIds) &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            (identical(other.isTemporary, isTemporary) ||
                other.isTemporary == isTemporary) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            (identical(other.lastMessageTime, lastMessageTime) ||
                other.lastMessageTime == lastMessageTime) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      chatRoomId,
      const DeepCollectionEquality().hash(_userIds),
      const DeepCollectionEquality().hash(_users),
      isTemporary,
      lastMessage,
      lastMessageTime,
      createdAt);

  /// Create a copy of ChatRoom
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatRoomImplCopyWith<_$ChatRoomImpl> get copyWith =>
      __$$ChatRoomImplCopyWithImpl<_$ChatRoomImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatRoomImplToJson(
      this,
    );
  }
}

abstract class _ChatRoom implements ChatRoom {
  const factory _ChatRoom(
          {final String chatRoomId,
          required final List<String> userIds,
          required final Map<String, ChatUserProfile> users,
          final bool isTemporary,
          final String lastMessage,
          @TimestampConverter() required final DateTime lastMessageTime,
          @TimestampConverter() required final DateTime createdAt}) =
      _$ChatRoomImpl;

  factory _ChatRoom.fromJson(Map<String, dynamic> json) =
      _$ChatRoomImpl.fromJson;

  @override
  String get chatRoomId;
  @override
  List<String> get userIds;
  @override
  Map<String, ChatUserProfile> get users;
  @override
  bool get isTemporary;
  @override
  String get lastMessage;
  @override
  @TimestampConverter()
  DateTime get lastMessageTime;
  @override
  @TimestampConverter()
  DateTime get createdAt;

  /// Create a copy of ChatRoom
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatRoomImplCopyWith<_$ChatRoomImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatUserProfile _$ChatUserProfileFromJson(Map<String, dynamic> json) {
  return _ChatUserProfile.fromJson(json);
}

/// @nodoc
mixin _$ChatUserProfile {
  String get imageUrl => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get userType => throw _privateConstructorUsedError;
  String get organization => throw _privateConstructorUsedError;

  /// Serializes this ChatUserProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatUserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatUserProfileCopyWith<ChatUserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatUserProfileCopyWith<$Res> {
  factory $ChatUserProfileCopyWith(
          ChatUserProfile value, $Res Function(ChatUserProfile) then) =
      _$ChatUserProfileCopyWithImpl<$Res, ChatUserProfile>;
  @useResult
  $Res call({String imageUrl, String name, int userType, String organization});
}

/// @nodoc
class _$ChatUserProfileCopyWithImpl<$Res, $Val extends ChatUserProfile>
    implements $ChatUserProfileCopyWith<$Res> {
  _$ChatUserProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatUserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = null,
    Object? name = null,
    Object? userType = null,
    Object? organization = null,
  }) {
    return _then(_value.copyWith(
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      userType: null == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as int,
      organization: null == organization
          ? _value.organization
          : organization // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatUserProfileImplCopyWith<$Res>
    implements $ChatUserProfileCopyWith<$Res> {
  factory _$$ChatUserProfileImplCopyWith(_$ChatUserProfileImpl value,
          $Res Function(_$ChatUserProfileImpl) then) =
      __$$ChatUserProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String imageUrl, String name, int userType, String organization});
}

/// @nodoc
class __$$ChatUserProfileImplCopyWithImpl<$Res>
    extends _$ChatUserProfileCopyWithImpl<$Res, _$ChatUserProfileImpl>
    implements _$$ChatUserProfileImplCopyWith<$Res> {
  __$$ChatUserProfileImplCopyWithImpl(
      _$ChatUserProfileImpl _value, $Res Function(_$ChatUserProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatUserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = null,
    Object? name = null,
    Object? userType = null,
    Object? organization = null,
  }) {
    return _then(_$ChatUserProfileImpl(
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      userType: null == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as int,
      organization: null == organization
          ? _value.organization
          : organization // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$ChatUserProfileImpl implements _ChatUserProfile {
  const _$ChatUserProfileImpl(
      {required this.imageUrl,
      required this.name,
      required this.userType,
      this.organization = ''});

  factory _$ChatUserProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatUserProfileImplFromJson(json);

  @override
  final String imageUrl;
  @override
  final String name;
  @override
  final int userType;
  @override
  @JsonKey()
  final String organization;

  @override
  String toString() {
    return 'ChatUserProfile(imageUrl: $imageUrl, name: $name, userType: $userType, organization: $organization)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatUserProfileImpl &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.userType, userType) ||
                other.userType == userType) &&
            (identical(other.organization, organization) ||
                other.organization == organization));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, imageUrl, name, userType, organization);

  /// Create a copy of ChatUserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatUserProfileImplCopyWith<_$ChatUserProfileImpl> get copyWith =>
      __$$ChatUserProfileImplCopyWithImpl<_$ChatUserProfileImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatUserProfileImplToJson(
      this,
    );
  }
}

abstract class _ChatUserProfile implements ChatUserProfile {
  const factory _ChatUserProfile(
      {required final String imageUrl,
      required final String name,
      required final int userType,
      final String organization}) = _$ChatUserProfileImpl;

  factory _ChatUserProfile.fromJson(Map<String, dynamic> json) =
      _$ChatUserProfileImpl.fromJson;

  @override
  String get imageUrl;
  @override
  String get name;
  @override
  int get userType;
  @override
  String get organization;

  /// Create a copy of ChatUserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatUserProfileImplCopyWith<_$ChatUserProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
