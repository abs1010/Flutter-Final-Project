
import 'package:get/get.dart';
import '../../UI/movies/movies_screen.dart';
import '../../domain/usecases/auth/login_with_email.dart';
import '../../domain/usecases/auth/register_with_email.dart';

class LoginPresenter extends GetxController {
  LoginPresenter({
    required this.loginWithEmail,
    required this.registerWithEmail,
  });

  LoginWithEmail loginWithEmail;
  RegisterWithEmail registerWithEmail;

  RxString errorMessage = RxString('');

  var userEmail = '';
  var userPassword = '';

  void onUserEmailUpdate(String email) {
    userEmail = email;
  }

  void onPasswordUpdate(String password) {
    userPassword = password;
  }

  void onLoginButtonPressed() async {
    var user = await loginWithEmail.execute(userEmail, userPassword);
    user ??= await registerWithEmail.execute(userEmail, userPassword);
    if (user == null) {
      errorMessage.value = 'Não foi possível logar';
    } else {
      Get.offNamed(MoviesScreen.id);
    }
  }
}
