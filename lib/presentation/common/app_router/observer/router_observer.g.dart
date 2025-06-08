// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router_observer.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentRouteHash() => r'016630e364602319afeee82ceeb33485891948a1';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// Return current route
///
/// Copied from [currentRoute].
@ProviderFor(currentRoute)
const currentRouteProvider = CurrentRouteFamily();

/// Return current route
///
/// Copied from [currentRoute].
class CurrentRouteFamily extends Family<String> {
  /// Return current route
  ///
  /// Copied from [currentRoute].
  const CurrentRouteFamily();

  /// Return current route
  ///
  /// Copied from [currentRoute].
  CurrentRouteProvider call(
    BuildContext context,
  ) {
    return CurrentRouteProvider(
      context,
    );
  }

  @override
  CurrentRouteProvider getProviderOverride(
    covariant CurrentRouteProvider provider,
  ) {
    return call(
      provider.context,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'currentRouteProvider';
}

/// Return current route
///
/// Copied from [currentRoute].
class CurrentRouteProvider extends AutoDisposeProvider<String> {
  /// Return current route
  ///
  /// Copied from [currentRoute].
  CurrentRouteProvider(
    BuildContext context,
  ) : this._internal(
          (ref) => currentRoute(
            ref as CurrentRouteRef,
            context,
          ),
          from: currentRouteProvider,
          name: r'currentRouteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$currentRouteHash,
          dependencies: CurrentRouteFamily._dependencies,
          allTransitiveDependencies:
              CurrentRouteFamily._allTransitiveDependencies,
          context: context,
        );

  CurrentRouteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.context,
  }) : super.internal();

  final BuildContext context;

  @override
  Override overrideWith(
    String Function(CurrentRouteRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CurrentRouteProvider._internal(
        (ref) => create(ref as CurrentRouteRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        context: context,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<String> createElement() {
    return _CurrentRouteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CurrentRouteProvider && other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CurrentRouteRef on AutoDisposeProviderRef<String> {
  /// The parameter `context` of this provider.
  BuildContext get context;
}

class _CurrentRouteProviderElement extends AutoDisposeProviderElement<String>
    with CurrentRouteRef {
  _CurrentRouteProviderElement(super.provider);

  @override
  BuildContext get context => (origin as CurrentRouteProvider).context;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
