import 'package:projeto_cadastro_final/main/usecases/movies/remote_fetch_movies_factory.dart';
import 'package:projeto_cadastro_final/presentation/movies/movies_presenter.dart';

MoviesPresenter makeMoviesPresenter() => MoviesPresenter(
  fetchMovies: makeRemoteFetchMovies()
);