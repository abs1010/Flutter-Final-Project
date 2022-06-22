import 'package:projeto_cadastro_final/domain/entities/movie_entity.dart';

class MovieModel {
  
  MovieModel({
    required this.title,
    required this.description,
    required this.posterPath,
    required this.rating,
  });

  String title;
  String description;
  String posterPath;
  String rating;

  factory MovieModel.fromJson(Map json) => MovieModel(
        posterPath: json['poster_path'],
        title: json['title'],
        description: json['overview'],
        rating: json['vote_average'].toString(),
      );

  MovieEntity toEntity() => MovieEntity(
        name: title,
        description: description,
        image: posterPath,
        rating: rating,
      );
}
