import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:simple_random_chat/infrastructure/network/firebase/firebase_options.dart';
import 'presentation/common/app_router/observer/dependency_observer.dart';
import 'presentation/common/app_router/provider/go_router_provider.dart';
import 'presentation/common/component/const/app_text.dart';
import 'presentation/common/component/widgets/default/size_config.dart';
import 'presentation/common/component/widgets/logger/logger.dart';

Future<void> _initEnvironment() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  /// Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await initializeDateFormatting();

  if (!kReleaseMode) {
    Log.voidInit();
  }
}

void main() async {
  await _initEnvironment();

  runApp(
    ProviderScope(
      observers: [
        DependencyObserver(),
      ], //Provider Debug
      child: const RandomChat(),
    ),
  );
}

class RandomChat extends ConsumerWidget {
  const RandomChat({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouteProvider);
    SizeConfig().init(context);

    return MaterialApp.router(
      routerConfig: router,
      title: AppText.projectName,
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        textSelectionTheme: const TextSelectionThemeData(selectionHandleColor: Colors.transparent),
      ),
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return child!;
      },
    );
  }
}
