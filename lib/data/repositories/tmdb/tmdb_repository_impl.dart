import 'dart:developer';

import 'package:cinebox/config/result/result.dart';
import 'package:cinebox/data/exceptions/data_exception.dart';
import 'package:cinebox/data/mappers/movie_mappers.dart';
import 'package:cinebox/data/services/tmdb/tmdb_service.dart';
import 'package:cinebox/domain/models/genre.dart';

import 'package:cinebox/domain/models/movie.dart';
import 'package:dio/dio.dart';

import './tmdb_repository.dart';

class TmdbRepositoryImpl implements TmdbRepository {
  final TmdbService _tmdbService;

  TmdbRepositoryImpl({required TmdbService tmdbService})
    : _tmdbService = tmdbService;

  @override
  Future<Result<List<Movie>>> getPopularMovies({
    String language = 'pt-BR',
    int page = 1,
  }) async {
    try {
      final moviesData = await _tmdbService.getPopularMovies(
        language: language,
        page: page,
      );
      return Success(MovieMappers.mapToMovie(moviesData));
    } on DioException catch (e, s) {
      log('Erro ao buscar getPopularMovies', error: e, stackTrace: s);
      return Failure(
        DataException(message: 'Erro ao buscar filmes populares'),
      );
    }
  }

  @override
  Future<Result<List<Movie>>> getNowPlayingMovies({
    String language = 'pt-BR',
    int page = 1,
  }) async {
    try {
      final moviesData = await _tmdbService.getNowPlayingMovies(
        language: language,
        page: page,
      );
      return Success(MovieMappers.mapToMovie(moviesData));
    } on DioException catch (e, s) {
      log('Erro ao buscar getNowPlayingMovies', error: e, stackTrace: s);
      return Failure(
        DataException(message: 'Erro ao buscar filmes em exibição'),
      );
    }
  }

  @override
  Future<Result<List<Movie>>> getTopRatedMovies({
    String language = 'pt-BR',
    int page = 1,
  }) async {
    try {
      final moviesData = await _tmdbService.getTopRatedMovies(
        language: language,
        page: page,
      );
      return Success(MovieMappers.mapToMovie(moviesData));
    } on DioException catch (e, s) {
      log('Erro ao buscar getTopRatedMovies', error: e, stackTrace: s);
      return Failure(
        DataException(message: 'Erro ao buscar filmes mais bem avaliados'),
      );
    }
  }

  @override
  Future<Result<List<Movie>>> getUpcomingMovies({
    String language = 'pt-BR',
    int page = 1,
  }) async {
    try {
      final moviesData = await _tmdbService.getUpcomingMovies(
        language: language,
        page: page,
      );
      return Success(MovieMappers.mapToMovie(moviesData));
    } on DioException catch (e, s) {
      log('Erro ao buscar getUpcomingMovies', error: e, stackTrace: s);
      return Failure(
        DataException(message: 'Erro ao buscar filmes futuros'),
      );
    }
  }

  @override
  Future<Result<List<Genre>>> getGenres() async {
    try {
      final data = await _tmdbService.getMovieGenres();
      final genres = data.genres
          .map((g) => Genre(id: g.id, name: g.name))
          .toList();
      return Success(genres);
    } on DioException catch (e, s) {
      log('Erro ao buscar gêneros', error: e, stackTrace: s);
      return Failure(
        DataException(message: 'Erro ao buscar gêneros'),
      );
    }
  }

  @override
  Future<Result<List<Movie>>> getMoviesByGenres({required int genreId}) async {
    try {
      final data = await _tmdbService.discoverMovies(
        withGenres: genreId.toString(),
      );
      return Success(MovieMappers.mapToMovie(data));
    } on DioException catch (e, s) {
      log('Erro ao buscar filmes por gênero', error: e, stackTrace: s);
      return Failure(
        DataException(message: 'Erro ao buscar filmes por gênero'),
      );
    }
  }
}
