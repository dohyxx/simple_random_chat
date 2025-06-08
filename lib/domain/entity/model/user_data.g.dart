// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDataImpl _$$UserDataImplFromJson(Map<String, dynamic> json) =>
    _$UserDataImpl(
      userId: json['userId'] as String,
      userType: $enumDecode(_$UserTypeEnumMap, json['userType']),
      phoneNumber: json['phoneNumber'] as String?,
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      profileUrl: json['profileUrl'] as String? ?? '',
      deviceId: json['deviceId'] as String?,
    );

Map<String, dynamic> _$$UserDataImplToJson(_$UserDataImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userType': _$UserTypeEnumMap[instance.userType]!,
      'phoneNumber': instance.phoneNumber,
      'name': instance.name,
      'email': instance.email,
      'profileUrl': instance.profileUrl,
      'deviceId': instance.deviceId,
    };

const _$UserTypeEnumMap = {
  UserType.guest: 1,
};
