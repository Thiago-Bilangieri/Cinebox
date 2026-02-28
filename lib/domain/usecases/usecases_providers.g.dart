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
