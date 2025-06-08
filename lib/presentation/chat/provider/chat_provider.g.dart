// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sendChatMessageHash() => r'6468f61dea930055c8a463c8ea6e51bfad59ebb5';

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

/// See also [sendChatMessage].
@ProviderFor(sendChatMessage)
const sendChatMessageProvider = SendChatMessageFamily();

/// See also [sendChatMessage].
class SendChatMessageFamily extends Family<AsyncValue<void>> {
  /// See also [sendChatMessage].
  const SendChatMessageFamily();

  /// See also [sendChatMessage].
  SendChatMessageProvider call(
    String chatRoomId,
    String message,
  ) {
    return SendChatMessageProvider(
      chatRoomId,
      message,
    );
  }

  @override
  SendChatMessageProvider getProviderOverride(
    covariant SendChatMessageProvider provider,
  ) {
    return call(
      provider.chatRoomId,
      provider.message,
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
  String? get name => r'sendChatMessageProvider';
}

/// See also [sendChatMessage].
class SendChatMessageProvider extends AutoDisposeFutureProvider<void> {
  /// See also [sendChatMessage].
  SendChatMessageProvider(
    String chatRoomId,
    String message,
  ) : this._internal(
          (ref) => sendChatMessage(
            ref as SendChatMessageRef,
            chatRoomId,
            message,
          ),
          from: sendChatMessageProvider,
          name: r'sendChatMessageProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sendChatMessageHash,
          dependencies: SendChatMessageFamily._dependencies,
          allTransitiveDependencies:
              SendChatMessageFamily._allTransitiveDependencies,
          chatRoomId: chatRoomId,
          message: message,
        );

  SendChatMessageProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.chatRoomId,
    required this.message,
  }) : super.internal();

  final String chatRoomId;
  final String message;

  @override
  Override overrideWith(
    FutureOr<void> Function(SendChatMessageRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SendChatMessageProvider._internal(
        (ref) => create(ref as SendChatMessageRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        chatRoomId: chatRoomId,
        message: message,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _SendChatMessageProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SendChatMessageProvider &&
        other.chatRoomId == chatRoomId &&
        other.message == message;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, chatRoomId.hashCode);
    hash = _SystemHash.combine(hash, message.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SendChatMessageRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `chatRoomId` of this provider.
  String get chatRoomId;

  /// The parameter `message` of this provider.
  String get message;
}

class _SendChatMessageProviderElement
    extends AutoDisposeFutureProviderElement<void> with SendChatMessageRef {
  _SendChatMessageProviderElement(super.provider);

  @override
  String get chatRoomId => (origin as SendChatMessageProvider).chatRoomId;
  @override
  String get message => (origin as SendChatMessageProvider).message;
}

String _$requestDeleteChatRoomHash() =>
    r'6914b8614513800d708f7512cda485731cf46d46';

/// See also [requestDeleteChatRoom].
@ProviderFor(requestDeleteChatRoom)
const requestDeleteChatRoomProvider = RequestDeleteChatRoomFamily();

/// See also [requestDeleteChatRoom].
class RequestDeleteChatRoomFamily extends Family<AsyncValue<bool>> {
  /// See also [requestDeleteChatRoom].
  const RequestDeleteChatRoomFamily();

  /// See also [requestDeleteChatRoom].
  RequestDeleteChatRoomProvider call(
    String chatRoomId,
  ) {
    return RequestDeleteChatRoomProvider(
      chatRoomId,
    );
  }

  @override
  RequestDeleteChatRoomProvider getProviderOverride(
    covariant RequestDeleteChatRoomProvider provider,
  ) {
    return call(
      provider.chatRoomId,
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
  String? get name => r'requestDeleteChatRoomProvider';
}

/// See also [requestDeleteChatRoom].
class RequestDeleteChatRoomProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [requestDeleteChatRoom].
  RequestDeleteChatRoomProvider(
    String chatRoomId,
  ) : this._internal(
          (ref) => requestDeleteChatRoom(
            ref as RequestDeleteChatRoomRef,
            chatRoomId,
          ),
          from: requestDeleteChatRoomProvider,
          name: r'requestDeleteChatRoomProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$requestDeleteChatRoomHash,
          dependencies: RequestDeleteChatRoomFamily._dependencies,
          allTransitiveDependencies:
              RequestDeleteChatRoomFamily._allTransitiveDependencies,
          chatRoomId: chatRoomId,
        );

  RequestDeleteChatRoomProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.chatRoomId,
  }) : super.internal();

  final String chatRoomId;

  @override
  Override overrideWith(
    FutureOr<bool> Function(RequestDeleteChatRoomRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RequestDeleteChatRoomProvider._internal(
        (ref) => create(ref as RequestDeleteChatRoomRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        chatRoomId: chatRoomId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _RequestDeleteChatRoomProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RequestDeleteChatRoomProvider &&
        other.chatRoomId == chatRoomId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, chatRoomId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RequestDeleteChatRoomRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `chatRoomId` of this provider.
  String get chatRoomId;
}

class _RequestDeleteChatRoomProviderElement
    extends AutoDisposeFutureProviderElement<bool>
    with RequestDeleteChatRoomRef {
  _RequestDeleteChatRoomProviderElement(super.provider);

  @override
  String get chatRoomId => (origin as RequestDeleteChatRoomProvider).chatRoomId;
}

String _$chatRoomListHash() => r'0361ebe08c33fd25dba9def5e3de52b6a5396c3d';

/// See also [ChatRoomList].
@ProviderFor(ChatRoomList)
final chatRoomListProvider =
    AutoDisposeAsyncNotifierProvider<ChatRoomList, List<ChatRoom>>.internal(
  ChatRoomList.new,
  name: r'chatRoomListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$chatRoomListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ChatRoomList = AutoDisposeAsyncNotifier<List<ChatRoom>>;
String _$createTemporaryChatRoomHash() =>
    r'cf7e9134dc39fdaa9f75a950b4e730ee579cd308';

abstract class _$CreateTemporaryChatRoom
    extends BuildlessAutoDisposeAsyncNotifier<String> {
  late final String? message;
  late final String? imageUrl;

  FutureOr<String> build({
    String? message,
    String? imageUrl,
  });
}

/// See also [CreateTemporaryChatRoom].
@ProviderFor(CreateTemporaryChatRoom)
const createTemporaryChatRoomProvider = CreateTemporaryChatRoomFamily();

/// See also [CreateTemporaryChatRoom].
class CreateTemporaryChatRoomFamily extends Family<AsyncValue<String>> {
  /// See also [CreateTemporaryChatRoom].
  const CreateTemporaryChatRoomFamily();

  /// See also [CreateTemporaryChatRoom].
  CreateTemporaryChatRoomProvider call({
    String? message,
    String? imageUrl,
  }) {
    return CreateTemporaryChatRoomProvider(
      message: message,
      imageUrl: imageUrl,
    );
  }

  @override
  CreateTemporaryChatRoomProvider getProviderOverride(
    covariant CreateTemporaryChatRoomProvider provider,
  ) {
    return call(
      message: provider.message,
      imageUrl: provider.imageUrl,
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
  String? get name => r'createTemporaryChatRoomProvider';
}

/// See also [CreateTemporaryChatRoom].
class CreateTemporaryChatRoomProvider
    extends AutoDisposeAsyncNotifierProviderImpl<CreateTemporaryChatRoom,
        String> {
  /// See also [CreateTemporaryChatRoom].
  CreateTemporaryChatRoomProvider({
    String? message,
    String? imageUrl,
  }) : this._internal(
          () => CreateTemporaryChatRoom()
            ..message = message
            ..imageUrl = imageUrl,
          from: createTemporaryChatRoomProvider,
          name: r'createTemporaryChatRoomProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createTemporaryChatRoomHash,
          dependencies: CreateTemporaryChatRoomFamily._dependencies,
          allTransitiveDependencies:
              CreateTemporaryChatRoomFamily._allTransitiveDependencies,
          message: message,
          imageUrl: imageUrl,
        );

  CreateTemporaryChatRoomProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.message,
    required this.imageUrl,
  }) : super.internal();

  final String? message;
  final String? imageUrl;

  @override
  FutureOr<String> runNotifierBuild(
    covariant CreateTemporaryChatRoom notifier,
  ) {
    return notifier.build(
      message: message,
      imageUrl: imageUrl,
    );
  }

  @override
  Override overrideWith(CreateTemporaryChatRoom Function() create) {
    return ProviderOverride(
      origin: this,
      override: CreateTemporaryChatRoomProvider._internal(
        () => create()
          ..message = message
          ..imageUrl = imageUrl,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        message: message,
        imageUrl: imageUrl,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<CreateTemporaryChatRoom, String>
      createElement() {
    return _CreateTemporaryChatRoomProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateTemporaryChatRoomProvider &&
        other.message == message &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, message.hashCode);
    hash = _SystemHash.combine(hash, imageUrl.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CreateTemporaryChatRoomRef
    on AutoDisposeAsyncNotifierProviderRef<String> {
  /// The parameter `message` of this provider.
  String? get message;

  /// The parameter `imageUrl` of this provider.
  String? get imageUrl;
}

class _CreateTemporaryChatRoomProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<CreateTemporaryChatRoom,
        String> with CreateTemporaryChatRoomRef {
  _CreateTemporaryChatRoomProviderElement(super.provider);

  @override
  String? get message => (origin as CreateTemporaryChatRoomProvider).message;
  @override
  String? get imageUrl => (origin as CreateTemporaryChatRoomProvider).imageUrl;
}

String _$chatMessageListHash() => r'16a88163c835f830a863f488cb3c1dddeee64b92';

abstract class _$ChatMessageList
    extends BuildlessAutoDisposeAsyncNotifier<List<ChatMessage>> {
  late final String chatRoomId;

  FutureOr<List<ChatMessage>> build(
    String chatRoomId,
  );
}

/// See also [ChatMessageList].
@ProviderFor(ChatMessageList)
const chatMessageListProvider = ChatMessageListFamily();

/// See also [ChatMessageList].
class ChatMessageListFamily extends Family<AsyncValue<List<ChatMessage>>> {
  /// See also [ChatMessageList].
  const ChatMessageListFamily();

  /// See also [ChatMessageList].
  ChatMessageListProvider call(
    String chatRoomId,
  ) {
    return ChatMessageListProvider(
      chatRoomId,
    );
  }

  @override
  ChatMessageListProvider getProviderOverride(
    covariant ChatMessageListProvider provider,
  ) {
    return call(
      provider.chatRoomId,
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
  String? get name => r'chatMessageListProvider';
}

/// See also [ChatMessageList].
class ChatMessageListProvider extends AutoDisposeAsyncNotifierProviderImpl<
    ChatMessageList, List<ChatMessage>> {
  /// See also [ChatMessageList].
  ChatMessageListProvider(
    String chatRoomId,
  ) : this._internal(
          () => ChatMessageList()..chatRoomId = chatRoomId,
          from: chatMessageListProvider,
          name: r'chatMessageListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$chatMessageListHash,
          dependencies: ChatMessageListFamily._dependencies,
          allTransitiveDependencies:
              ChatMessageListFamily._allTransitiveDependencies,
          chatRoomId: chatRoomId,
        );

  ChatMessageListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.chatRoomId,
  }) : super.internal();

  final String chatRoomId;

  @override
  FutureOr<List<ChatMessage>> runNotifierBuild(
    covariant ChatMessageList notifier,
  ) {
    return notifier.build(
      chatRoomId,
    );
  }

  @override
  Override overrideWith(ChatMessageList Function() create) {
    return ProviderOverride(
      origin: this,
      override: ChatMessageListProvider._internal(
        () => create()..chatRoomId = chatRoomId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        chatRoomId: chatRoomId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ChatMessageList, List<ChatMessage>>
      createElement() {
    return _ChatMessageListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChatMessageListProvider && other.chatRoomId == chatRoomId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, chatRoomId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ChatMessageListRef
    on AutoDisposeAsyncNotifierProviderRef<List<ChatMessage>> {
  /// The parameter `chatRoomId` of this provider.
  String get chatRoomId;
}

class _ChatMessageListProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ChatMessageList,
        List<ChatMessage>> with ChatMessageListRef {
  _ChatMessageListProviderElement(super.provider);

  @override
  String get chatRoomId => (origin as ChatMessageListProvider).chatRoomId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
