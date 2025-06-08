import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_random_chat/domain/entity/enum/user_type.dart';

part 'user_data.freezed.dart';
part 'user_data.g.dart';

/// 현재 유저 정보
@freezed
class UserData with _$UserData {
  const factory UserData({
    required final String userId,
    required final UserType userType,
    final String? phoneNumber,
    @Default('') final String? name,
    @Default('') final String? email,
    @Default('') final String? profileUrl,
    final String? deviceId,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
}
