import 'package:cinebox/data/models/movie_response.dart';
import 'package:cinebox/domain/models/movie.dart';

class MovieMappers {
  static List<Movie> mapToMovie(MovieResponse movieResponse) {
    return movieResponse.results.map((movieData) {
      return Movie(
        id: movieData.id,
        title: movieData.title,
        overview: movieData.overview,
        genreIds: movieData.genreIds ?? [],
        posterPath: movieData.posterPath,
        backdropPath: movieData.backdropPath,
        voteAverage: movieData.voteAverage,
        releaseDate: movieData.releaseDate,
      );
    }).toList();
  }
}
