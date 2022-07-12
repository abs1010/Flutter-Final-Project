import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_cadastro_final/UI/movies/movies_screen.dart';
import 'package:projeto_cadastro_final/presentation/movies/movies_presenter.dart';

import '../fetch_movies_mock.dart';

void main() {
  late MoviesPresenter sut;
  late FetchMoviesMock fetchMovies;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    fetchMovies = FetchMoviesMock();
    sut = MoviesPresenter(fetchMovies: fetchMovies);
  });

  testWidgets('MoviesScreen has list', (tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(MoviesScreen(presenter: sut));
  });
}
