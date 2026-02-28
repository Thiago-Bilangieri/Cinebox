// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usecases_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getMoviesByCategoryUsecase)
final getMoviesByCategoryUsecaseProvider =
    GetMoviesByCategoryUsecaseProvider._();

final class GetMoviesByCategoryUsecaseProvider
    extends
        $FunctionalProvider<
          GetMoviesByCategoryUsecase,
          GetMoviesByCategoryUsecase,
          GetMoviesByCategoryUsecase
        >
    with $Provider<GetMoviesByCategoryUsecase> {
  GetMoviesByCategoryUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getMoviesByCategoryUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getMoviesByCategoryUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetMoviesByCategoryUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetMoviesByCategoryUsecase create(Ref ref) {
    return getMoviesByCategoryUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetMoviesByCategoryUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetMoviesByCategoryUsecase>(value),
    );
  }
}

String _$getMoviesByCategoryUsecaseHash() =>
    r'ee1e937b2a6758ba1014ec7b0a329dcbccfeda95';

@ProviderFor(getMoviesByGenreUsecase)
final getMoviesByGenreUsecaseProvider = GetMoviesByGenreUsecaseProvider._();

final class GetMoviesByGenreUsecaseProvider
    extends
        $FunctionalProvider<
          GetMoviesByGenreUsecase,
          GetMoviesByGenreUsecase,
          GetMoviesByGenreUsecase
        >
    with $Provider<GetMoviesByGenreUsecase> {
  GetMoviesByGenreUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getMoviesByGenreUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getMoviesByGenreUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetMoviesByGenreUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetMoviesByGenreUsecase create(Ref ref) {
    return getMoviesByGenreUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetMoviesByGenreUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetMoviesByGenreUsecase>(value),
    );
  }
}

String _$getMoviesByGenreUsecaseHash() =>
    r'1c5e404369d8c0263feca80c0d12a699c706ae80';
