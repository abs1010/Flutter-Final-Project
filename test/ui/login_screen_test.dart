import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_cadastro_final/UI/login/login_screen.dart';
import 'package:projeto_cadastro_final/domain/usecases/auth/login_with_email.dart';
import 'package:projeto_cadastro_final/domain/usecases/auth/register_with_email.dart';
import 'package:projeto_cadastro_final/presentation/login/login_presenter.dart';

void main() {
  late LoginPresenter sut;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    sut = LoginPresenter(
        loginWithEmail: FakeLogin(), registerWithEmail: FakeRegister());
  });

  testWidgets('LoginScreen has a email and password', (tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(LoginScreen(presenter: sut));
  });
}

class FakeLogin extends LoginWithEmail {
  @override
  Future<User?> execute(String email, String password) {
    throw UnimplementedError();
  }
}

class FakeRegister extends RegisterWithEmail {
  @override
  Future<User?> execute(String email, String password) {
    throw UnimplementedError();
  }
}
