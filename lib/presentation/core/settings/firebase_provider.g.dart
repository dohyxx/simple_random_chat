// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$firebaseAuthenticationHash() =>
    r'4e60fe3049f1f47c9cbeeb97bb7f2e975895d15a';

/// [Firebase Auth]
///
/// Copied from [FirebaseAuthentication].
@ProviderFor(FirebaseAuthentication)
final firebaseAuthenticationProvider =
    AutoDisposeNotifierProvider<FirebaseAuthentication, FirebaseAuth>.internal(
  FirebaseAuthentication.new,
  name: r'firebaseAuthenticationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firebaseAuthenticationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FirebaseAuthentication = AutoDisposeNotifier<FirebaseAuth>;
String _$cloudFirestoreHash() => r'3ffa545fa8350532c7eabef7217e851bcf665ad3';

/// [Cloud Firestore]
///
/// Copied from [CloudFirestore].
@ProviderFor(CloudFirestore)
final cloudFirestoreProvider =
    AutoDisposeNotifierProvider<CloudFirestore, FirebaseFirestore>.internal(
  CloudFirestore.new,
  name: r'cloudFirestoreProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$cloudFirestoreHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CloudFirestore = AutoDisposeNotifier<FirebaseFirestore>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
