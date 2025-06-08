import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simple_random_chat/presentation/common/component/widgets/logger/logger.dart';

part 'router_observer.g.dart';

class RouterObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    Log.i("Push page: ${route.settings.name}");
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    Log.i("Pop page: ${route.settings.name}");
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    Log.i("Remove page: ${route.settings.name}");
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    Log.i("Replace Page: ${newRoute?.settings.name}");
  }
}

/// Return current route
@riverpod
String currentRoute(Ref ref, BuildContext context) {
  return GoRouterState.of(context).fullPath ?? '/';
}
