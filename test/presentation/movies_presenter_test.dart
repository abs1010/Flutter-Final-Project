import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:projeto_cadastro_final/data/http/domain_error.dart';
import 'package:projeto_cadastro_final/presentation/movies/movies_presenter.dart';
import 'package:projeto_cadastro_final/domain/entities/movie_entity.dart';
import 'package:projeto_cadastro_final/domain/usecases/movies/fetch_movies.dart';

void main() {
  late MoviesPresenter sut;
  late FetchMoviesMock fetchMovies;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    fetchMovies = FetchMoviesMock();
    sut = MoviesPresenter(fetchMovies: fetchMovies);
  });

  test('Should call fetch movies on init', () async {
    sut.onInit();
    verify(() => fetchMovies.execute());
  });

  test('Should the name of the first element be equal to string', () async {
      sut.viewModel.listen(expectAsync1((viewModel) => expect(
            viewModel.moviesList.first.name, 'Minions: The Rise of Gru',
          )));
      sut.onInit();
    },
  );

  test( 'Should return the size of the array', () async {
      sut.viewModel.listen(expectAsync1((viewModel) => expect(
            viewModel.moviesList.length, _getMockedMoviesArray().length,
          )));
      sut.onInit();
    },
  );

  test('Should the imagw of the first element be equal to string', () async {
      sut.viewModel.listen(expectAsync1((viewModel) => expect(
            viewModel.moviesList.first.image, '/qTkJ6kbTeSjqfHCFCmWnfWZJOtm.jpg',
          )));
      sut.onInit();
    },
  );

  test('Should the rating value of the first element be equal to string', () async {
      sut.viewModel.listen(expectAsync1((viewModel) => expect(
            viewModel.moviesList.first.rating,'7.8',
          )));
      sut.onInit();
    },
  );

  test('Should emit movies list when fetch movies succeed', () async {
      sut.viewModel.listen(expectAsync1((viewModel) => expect(
            viewModel.moviesList.first.name,
            _getMockedMoviesArray().first.name,
          )));
      sut.onInit();
    },
  );

  test('Should emit generic error message list when fetch movies throw unexpected', () async {
    fetchMovies.mockError(DomainError.unexpected);
    sut.viewModel.listen(expectAsync1((viewModel) => expect(
          viewModel.errorMessage,
          'Erro, tente novamente',
        )));
    sut.onInit();
  });
}

class FetchMoviesMock extends Mock implements FetchMovies {
  FetchMoviesMock() {
    mockExecute(_getMockedMoviesArray());
  }

  void mockExecute(List<MovieEntity> moviesList) {
    when(() => execute()).thenAnswer((_) async => moviesList);
  }

  void mockError(DomainError error) {
    when(() => execute()).thenThrow(error);
  }
}

List<MovieEntity> _getMockedMoviesArray() => [
      MovieEntity(
        name: 'Minions: The Rise of Gru',
        description:
            'A continua????o das aventuras dos Minions, sempre em busca de um l??der tir??nico. Dessa vez, eles ajudam um Gru ainda crian??a, descobrindo como ser vil??o.',
        image: '/qTkJ6kbTeSjqfHCFCmWnfWZJOtm.jpg',
        rating: '7.8',
      ),
      MovieEntity(
        name: 'Doctor Strange in the Multiverse of Madness',
        description: 'Doutor Estranho, com a ajuda de aliados m??sticos antigos e novos, atravessa as perigosas realidades alternativas e alucinantes do Multiverso para enfrentar um novo advers??rio misterioso.',
        image: '/boIgXXUhw5O3oVkhXsE6SJZkmYo.jpg',
        rating: '7.5',
      ),
      MovieEntity(
        name: 'Thor: Love and Thunder',
        description: 'Thor parte em uma jornada diferente de tudo que j?? enfrentou ??? uma busca pela paz interior. Mas sua aposentadoria ?? interrompida por um assassino gal??ctico conhecido como Gorr, o Carniceiro de Deus, que busca a extin????o dos deuses. Para combater a amea??a, Thor pede a ajuda do Rei Valqu??ria, Korg e da ex-namorada Jane Foster, que ??? para surpresa de Thor ??? inexplicavelmente empunha seu martelo m??gico, Mjolnir, como o Poderoso Thor. Juntos, eles embarcam em uma angustiante aventura c??smica para descobrir o mist??rio da vingan??a do God Butcher e det??-lo antes que seja tarde demais.',
        image: '/6OEBp0Gqv6DsOgi8diPUslT2kbA.jpg',
        rating: '7.1',
      ),
      MovieEntity(
        name: 'Jurassic World Dominion',
        description: 'Quatro anos ap??s a destrui????o da Ilha Nublar, os dinossauros agora vivem ??? e ca??am ??? ao lado de humanos em todo o mundo. Esse fr??gil equil??brio remodelar?? o futuro e determinar??, de uma vez por todas, se os seres humanos continuar??o sendo os principais predadores em um planeta que agora compartilham com as criaturas mais tem??veis da hist??ria.',
        image: '/rvX8f3QuUkYtirO0hL9CoeXMzkv.jpg',
        rating: '6.6',
      ),
      MovieEntity(
        name: 'The Ledge',
        description: '',
        image: '/dHKfsdNcEPw7YIWFPIhqiuWrSAb.jpg',
        rating: '6.5',
      ),
    ];
