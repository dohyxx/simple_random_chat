import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_random_chat/presentation/common/component/widgets/logger/logger.dart';

class DependencyObserver extends ProviderObserver {
  @override
  void didAddProvider(
    ProviderBase provider,
    Object? value,
    ProviderContainer container,
  ) {
    super.didAddProvider(provider, value, container);
    Log.i('Added Provider: ${provider.name ?? provider.runtimeType}');
  }

  @override
  void didDisposeProvider(
    ProviderBase provider,
    ProviderContainer container,
  ) {
    super.didDisposeProvider(provider, container);
    Log.i('Disposed Provider: ${provider.name ?? provider.runtimeType}');
  }
}
