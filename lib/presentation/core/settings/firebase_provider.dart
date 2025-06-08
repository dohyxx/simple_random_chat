import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_provider.g.dart';

/// [Firebase Auth]
@riverpod
class FirebaseAuthentication extends _$FirebaseAuthentication {
  @override
  FirebaseAuth build() => FirebaseAuth.instance;
}

/// [Cloud Firestore]
@riverpod
class CloudFirestore extends _$CloudFirestore {
  @override
  FirebaseFirestore build() => FirebaseFirestore.instance;
}
