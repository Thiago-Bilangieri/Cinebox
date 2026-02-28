import 'package:cinebox/config/result/result.dart';
import 'package:cinebox/domain/models/movies_by_category.dart';
import 'package:cinebox/domain/usecases/usecases_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_movies_by_category_command.g.dart';

@riverpod
class GetMoviesByCategoryCommand extends _$GetMoviesByCategoryCommand {
  AsyncValue<MoviesByCategory?> build() {
    return const AsyncData(null);
  }

  Future<void> execute() async {
    state = AsyncLoading();
    final getMoviesByCategoryUC = ref.read(getMoviesByCategoryUsecaseProvider);
    final result = await getMoviesByCategoryUC.execute();

    state = switch (result) {
      Success(:final value) => AsyncValue.data(value),
      Failure() => AsyncValue.error(
        'Erro ao buscar filmees por categoria',
        StackTrace.current,
      ),
    };
  }
}
