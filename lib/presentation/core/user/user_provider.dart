import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simple_random_chat/domain/entity/enum/user_type.dart';
import 'package:simple_random_chat/domain/entity/model/user_data.dart';
import 'package:simple_random_chat/infrastructure/network/config/app_config.dart';

part 'user_provider.g.dart';

/*
 * Current User
 */
@Riverpod(keepAlive: true)
class User extends _$User {
  @override
  UserData build() => UserData(
        userType: UserType.guest,

        /// TODO: Add Firebase Auth User Token
        userId: AppConfig.temporaryUserToken,
      );
}
