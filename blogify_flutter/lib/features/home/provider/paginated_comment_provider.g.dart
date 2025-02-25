// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_comment_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$paginatedCommentHash() => r'cee9ddce21ace0b805ff1814ceaeb42d8e24cbeb';

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

abstract class _$PaginatedComment
    extends BuildlessAutoDisposeNotifier<PagingStatus> {
  late final int postId;
  late final int? parentCommentId;

  PagingStatus build(
    int postId,
    int? parentCommentId,
  );
}

/// See also [PaginatedComment].
@ProviderFor(PaginatedComment)
const paginatedCommentProvider = PaginatedCommentFamily();

/// See also [PaginatedComment].
class PaginatedCommentFamily extends Family<PagingStatus> {
  /// See also [PaginatedComment].
  const PaginatedCommentFamily();

  /// See also [PaginatedComment].
  PaginatedCommentProvider call(
    int postId,
    int? parentCommentId,
  ) {
    return PaginatedCommentProvider(
      postId,
      parentCommentId,
    );
  }

  @override
  PaginatedCommentProvider getProviderOverride(
    covariant PaginatedCommentProvider provider,
  ) {
    return call(
      provider.postId,
      provider.parentCommentId,
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
  String? get name => r'paginatedCommentProvider';
}

/// See also [PaginatedComment].
class PaginatedCommentProvider
    extends AutoDisposeNotifierProviderImpl<PaginatedComment, PagingStatus> {
  /// See also [PaginatedComment].
  PaginatedCommentProvider(
    int postId,
    int? parentCommentId,
  ) : this._internal(
          () => PaginatedComment()
            ..postId = postId
            ..parentCommentId = parentCommentId,
          from: paginatedCommentProvider,
          name: r'paginatedCommentProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$paginatedCommentHash,
          dependencies: PaginatedCommentFamily._dependencies,
          allTransitiveDependencies:
              PaginatedCommentFamily._allTransitiveDependencies,
          postId: postId,
          parentCommentId: parentCommentId,
        );

  PaginatedCommentProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.postId,
    required this.parentCommentId,
  }) : super.internal();

  final int postId;
  final int? parentCommentId;

  @override
  PagingStatus runNotifierBuild(
    covariant PaginatedComment notifier,
  ) {
    return notifier.build(
      postId,
      parentCommentId,
    );
  }

  @override
  Override overrideWith(PaginatedComment Function() create) {
    return ProviderOverride(
      origin: this,
      override: PaginatedCommentProvider._internal(
        () => create()
          ..postId = postId
          ..parentCommentId = parentCommentId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        postId: postId,
        parentCommentId: parentCommentId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<PaginatedComment, PagingStatus>
      createElement() {
    return _PaginatedCommentProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PaginatedCommentProvider &&
        other.postId == postId &&
        other.parentCommentId == parentCommentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, postId.hashCode);
    hash = _SystemHash.combine(hash, parentCommentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PaginatedCommentRef on AutoDisposeNotifierProviderRef<PagingStatus> {
  /// The parameter `postId` of this provider.
  int get postId;

  /// The parameter `parentCommentId` of this provider.
  int? get parentCommentId;
}

class _PaginatedCommentProviderElement
    extends AutoDisposeNotifierProviderElement<PaginatedComment, PagingStatus>
    with PaginatedCommentRef {
  _PaginatedCommentProviderElement(super.provider);

  @override
  int get postId => (origin as PaginatedCommentProvider).postId;
  @override
  int? get parentCommentId =>
      (origin as PaginatedCommentProvider).parentCommentId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
