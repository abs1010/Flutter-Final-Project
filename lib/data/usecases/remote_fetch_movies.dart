import 'package:projeto_cadastro_final/data/http/domain_error.dart';
import 'package:projeto_cadastro_final/data/http/http_client.dart';
import 'package:projeto_cadastro_final/data/http/http_error.dart';
import 'package:projeto_cadastro_final/data/usecases/movies/movie_model.dart';
import 'package:projeto_cadastro_final/domain/entities/movie_entity.dart';
import 'package:projeto_cadastro_final/domain/usecases/movies/fetch_movies.dart';

class RemoteFetchMovies extends FetchMovies {
  RemoteFetchMovies({
    required this.httpClient,
  });

  final HttpClient httpClient;

  @override
  Future<List<MovieEntity>> execute() async {
    try {
      final response =
          await httpClient.get(url: 'https://demo7206081.mockable.io/movies');

      final moviesList = response?['results']
          .map<MovieEntity>((json) => MovieModel.fromJson(json).toEntity())
          .toList();

      return moviesList ?? [];
    } on HttpError catch (error) {
      if (error == HttpError.forbidden || error == HttpError.unauthorized) {
        throw DomainError.invalidCredentials;
      } else {
        throw DomainError.unexpected;
      }
    }
  }
}
