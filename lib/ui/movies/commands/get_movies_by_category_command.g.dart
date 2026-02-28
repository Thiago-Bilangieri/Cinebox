// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_movies_by_category_command.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GetMoviesByCategoryCommand)
final getMoviesByCategoryCommandProvider =
    GetMoviesByCategoryCommandProvider._();

final class GetMoviesByCategoryCommandProvider
    extends
        $NotifierProvider<
          GetMoviesByCategoryCommand,
          AsyncValue<MoviesByCategory?>
        > {
  GetMoviesByCategoryCommandProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getMoviesByCategoryCommandProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getMoviesByCategoryCommandHash();

  @$internal
  @override
  GetMoviesByCategoryCommand create() => GetMoviesByCategoryCommand();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<MoviesByCategory?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<MoviesByCategory?>>(
        value,
      ),
    );
  }
}

String _$getMoviesByCategoryCommandHash() =>
    r'1756a0822ce674f4768568552b5c680b10e4ee08';

abstract class _$GetMoviesByCategoryCommand
    extends $Notifier<AsyncValue<MoviesByCategory?>> {
  AsyncValue<MoviesByCategory?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<MoviesByCategory?>,
              AsyncValue<MoviesByCategory?>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<MoviesByCategory?>,
                AsyncValue<MoviesByCategory?>
              >,
              AsyncValue<MoviesByCategory?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
