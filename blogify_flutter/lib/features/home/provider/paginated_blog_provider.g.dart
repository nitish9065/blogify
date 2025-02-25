// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_blog_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$paginatedBlogHash() => r'4f648156d08eca8397edb86fd66f6699ea5a9d35';

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

abstract class _$PaginatedBlog extends BuildlessNotifier<PagingStatus> {
  late final int? categoryId;
  late final int? userId;
  late final PostStatus? status;

  PagingStatus build({
    int? categoryId,
    int? userId,
    PostStatus? status,
  });
}

/// See also [PaginatedBlog].
@ProviderFor(PaginatedBlog)
const paginatedBlogProvider = PaginatedBlogFamily();

/// See also [PaginatedBlog].
class PaginatedBlogFamily extends Family<PagingStatus> {
  /// See also [PaginatedBlog].
  const PaginatedBlogFamily();

  /// See also [PaginatedBlog].
  PaginatedBlogProvider call({
    int? categoryId,
    int? userId,
    PostStatus? status,
  }) {
    return PaginatedBlogProvider(
      categoryId: categoryId,
      userId: userId,
      status: status,
    );
  }

  @override
  PaginatedBlogProvider getProviderOverride(
    covariant PaginatedBlogProvider provider,
  ) {
    return call(
      categoryId: provider.categoryId,
      userId: provider.userId,
      status: provider.status,
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
  String? get name => r'paginatedBlogProvider';
}

/// See also [PaginatedBlog].
class PaginatedBlogProvider
    extends NotifierProviderImpl<PaginatedBlog, PagingStatus> {
  /// See also [PaginatedBlog].
  PaginatedBlogProvider({
    int? categoryId,
    int? userId,
    PostStatus? status,
  }) : this._internal(
          () => PaginatedBlog()
            ..categoryId = categoryId
            ..userId = userId
            ..status = status,
          from: paginatedBlogProvider,
          name: r'paginatedBlogProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$paginatedBlogHash,
          dependencies: PaginatedBlogFamily._dependencies,
          allTransitiveDependencies:
              PaginatedBlogFamily._allTransitiveDependencies,
          categoryId: categoryId,
          userId: userId,
          status: status,
        );

  PaginatedBlogProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.categoryId,
    required this.userId,
    required this.status,
  }) : super.internal();

  final int? categoryId;
  final int? userId;
  final PostStatus? status;

  @override
  PagingStatus runNotifierBuild(
    covariant PaginatedBlog notifier,
  ) {
    return notifier.build(
      categoryId: categoryId,
      userId: userId,
      status: status,
    );
  }

  @override
  Override overrideWith(PaginatedBlog Function() create) {
    return ProviderOverride(
      origin: this,
      override: PaginatedBlogProvider._internal(
        () => create()
          ..categoryId = categoryId
          ..userId = userId
          ..status = status,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        categoryId: categoryId,
        userId: userId,
        status: status,
      ),
    );
  }

  @override
  NotifierProviderElement<PaginatedBlog, PagingStatus> createElement() {
    return _PaginatedBlogProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PaginatedBlogProvider &&
        other.categoryId == categoryId &&
        other.userId == userId &&
        other.status == status;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, categoryId.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);
    hash = _SystemHash.combine(hash, status.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PaginatedBlogRef on NotifierProviderRef<PagingStatus> {
  /// The parameter `categoryId` of this provider.
  int? get categoryId;

  /// The parameter `userId` of this provider.
  int? get userId;

  /// The parameter `status` of this provider.
  PostStatus? get status;
}

class _PaginatedBlogProviderElement
    extends NotifierProviderElement<PaginatedBlog, PagingStatus>
    with PaginatedBlogRef {
  _PaginatedBlogProviderElement(super.provider);

  @override
  int? get categoryId => (origin as PaginatedBlogProvider).categoryId;
  @override
  int? get userId => (origin as PaginatedBlogProvider).userId;
  @override
  PostStatus? get status => (origin as PaginatedBlogProvider).status;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
