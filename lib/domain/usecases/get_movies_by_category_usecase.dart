import 'package:cinebox/config/result/result.dart';
import 'package:cinebox/data/repositories/tmdb/tmdb_repository.dart';
import 'package:cinebox/domain/models/movie.dart';
import 'package:cinebox/domain/models/movies_by_category.dart';

class GetMoviesByCategoryUsecase {
  final TmdbRepository _tmdbRepository;

  GetMoviesByCategoryUsecase({required TmdbRepository tmdbRepository})
    : _tmdbRepository = tmdbRepository;

  Future<Result<MoviesByCategory>> execute() async {
    final result = await Future.wait([
      _tmdbRepository.getPopularMovies(),
      _tmdbRepository.getNowPlayingMovies(),
      _tmdbRepository.getTopRatedMovies(),
      _tmdbRepository.getUpcomingMovies(),
    ]);
    if (result case [
      Success<List<Movie>>(value: final popular),
      Success<List<Movie>>(value: final nowPlaying),
      Success<List<Movie>>(value: final topRated),
      Success<List<Movie>>(value: final upcoming),
    ]) {
      return Success(
        MoviesByCategory(
          popular: popular,
          nowPlaying: nowPlaying,
          topRated: topRated,
          upcoming: upcoming,
        ),
      );
    }
    return Failure(Exception('Erro ao buscar filmes por categoria'));
  }
}
