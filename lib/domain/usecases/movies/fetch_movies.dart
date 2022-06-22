import 'package:projeto_cadastro_final/domain/entities/movie_entity.dart';

abstract class FetchMovies {
  Future<List<MovieEntity>> execute();
}
