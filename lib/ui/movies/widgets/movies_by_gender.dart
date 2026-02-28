import 'package:cinebox/ui/movies/commands/get_movies_by_genre_command.dart';
import 'package:cinebox/ui/movies/widgets/movies_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviesByGender extends ConsumerWidget {
  const MoviesByGender({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchMovies = ref.watch(getMoviesByGenreCommandProvider);
    return searchMovies.when(
      loading: () => Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) =>
          Center(child: Text('Erro ao carregar filmes por gênero')),
      data: (data) => Container(
        padding: EdgeInsets.only(bottom: 130),
        child: MoviesBox(
          title: 'Movies by Gender',
          movies: data,
          vertical: true,
        ),
      ),
    );
  }
}
