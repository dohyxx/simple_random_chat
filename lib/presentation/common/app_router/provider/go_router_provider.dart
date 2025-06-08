import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simple_random_chat/presentation/common/app_router/app_router.dart';
import '../route_name.dart';

part 'go_router_provider.g.dart';

@riverpod
class GoRoute extends _$GoRoute {
  @override
  GoRouter build() {
    return GoRouter(
      navigatorKey: GlobalNavigator.key,
      // observers: [RouterObserver()],
      initialLocation: RouteName.home,
      routes: AppRouter.routes,
    );
  }

  Future<void> navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 500), () {
      //
    });
  }
}

class NavigationHelper {
  /// Pop
  static dynamic pop({result}) => GoRouter.of(GlobalNavigator.key.currentContext!).pop(result);

  /// Push
  static Future<Object?> push(String location, {Object? extra}) =>
      GoRouter.of(GlobalNavigator.key.currentContext!).push(location, extra: extra);

  /// Go
  static void go(String location, {Object? extra}) =>
      GoRouter.of(GlobalNavigator.key.currentContext!).go(location, extra: extra);

  /// Replace
  static void replace(String location, {Object? extra}) =>
      GoRouter.of(GlobalNavigator.key.currentContext!).replace(location, extra: extra);

  /// pushReplacement
  static void pushReplacement(String location, {Object? extra}) =>
      GoRouter.of(GlobalNavigator.key.currentContext!).pushReplacement(location, extra: extra);
}
