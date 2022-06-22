import 'package:projeto_cadastro_final/domain/entities/movie_entity.dart';

class MoviesViewModel {
  MoviesViewModel({
    required this.moviesList,
    required this.errorMessage,
  });

  MoviesViewModel copyWith({
    List<MovieEntity>? moviesList,
    String? errorMessage,
  }) =>
      MoviesViewModel(
        moviesList: moviesList ?? this.moviesList,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  List<MovieEntity> moviesList;
  String errorMessage;
}
