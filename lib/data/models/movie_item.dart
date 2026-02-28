import 'package:json_annotation/json_annotation.dart';

part 'movie_item.g.dart';

@JsonSerializable()
class MovieItem {
  final int id;
  final String title;
  final String overview;
  final List<int>? genreIds;
  final String? posterPath;
  final String? backdropPath;
  final double voteAverage;
  final String? releaseDate;

  factory MovieItem.fromJson(Map<String, dynamic> json) =>
      _$MovieItemFromJson(json);

  MovieItem({
    required this.id,
    required this.title,
    required this.overview,
    this.genreIds,
    this.posterPath,
    this.backdropPath,
    required this.voteAverage,
    this.releaseDate,
  });

  Map<String, dynamic> toJson() => _$MovieItemToJson(this);
}
//**
//
//"id": 640146,
  //    "original_language": "en",
  //    "original_title": "Ant-Man and the Wasp: Quantumania",
  //    "overview": "Super-Hero partners Scott Lang and Hope van Dyne, along with with Hope's parents Janet van Dyne and Hank Pym, and Scott's daughter Cassie Lang, find themselves exploring the Quantum Realm, interacting with strange new creatures and embarking on an adventure that will push them beyond the limits of what they thought possible.",
  //    "popularity": 8567.865,
  //    "poster_path": "/ngl2FKBlU4fhbdsrtdom9LVLBXw.jpg",
  //    "release_date": "2023-02-15",
  //    "title": "Ant-Man and the Wasp: Quantumania",
  //    "video": false,
  //    "vote_average": 6.5,
  //    "vote_count": 1886
// */