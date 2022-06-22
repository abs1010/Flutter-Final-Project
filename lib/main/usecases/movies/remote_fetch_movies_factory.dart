import 'package:projeto_cadastro_final/data/usecases/remote_fetch_movies.dart';
import 'package:projeto_cadastro_final/domain/usecases/movies/fetch_movies.dart';
import 'package:projeto_cadastro_final/main/infra/http_adapter_factory.dart';

FetchMovies makeRemoteFetchMovies() => RemoteFetchMovies(httpClient: makeHttpAdapter());
