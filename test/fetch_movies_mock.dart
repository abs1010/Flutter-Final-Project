import 'package:mocktail/mocktail.dart';
import 'package:projeto_cadastro_final/data/http/domain_error.dart';
import 'package:projeto_cadastro_final/domain/entities/movie_entity.dart';
import 'package:projeto_cadastro_final/domain/usecases/movies/fetch_movies.dart';

class FetchMoviesMock extends Mock implements FetchMovies {
  FetchMoviesMock();

  void mockExecute(List<MovieEntity> moviesList) {
    when(() => execute()).thenAnswer((_) async => moviesList);
  }

  void mockError(DomainError error) {
    when(() => execute()).thenThrow(error);
  }
}