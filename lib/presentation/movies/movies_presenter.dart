import 'package:projeto_cadastro_final/data/http/domain_error.dart';
import 'package:projeto_cadastro_final/domain/usecases/movies/fetch_movies.dart';
import 'package:projeto_cadastro_final/presentation/movies/movies_view_model.dart';
import 'package:get/get.dart';

class MoviesPresenter extends GetxController {
  MoviesPresenter({required this.fetchMovies});

  final FetchMovies fetchMovies;

  final viewModel = Rx<MoviesViewModel>(MoviesViewModel(
    moviesList: [],
    errorMessage: '',
  ));

  @override
  void onInit() async {
    super.onInit();
    try {
      viewModel.value = viewModel.value.copyWith(
        moviesList: await fetchMovies.execute(),
      );
    } on DomainError catch (error) {
      final errorMessage = (error == DomainError.invalidCredentials)
          ? 'Credenciais inválidas'
          : 'Erro, tente novamente';

      viewModel.value = viewModel.value.copyWith(
        errorMessage: errorMessage,
      );
    }
  }
}
