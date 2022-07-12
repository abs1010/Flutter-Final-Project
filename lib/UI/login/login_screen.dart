import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto_cadastro_final/UI/login/rounded_button.dart';
import 'package:projeto_cadastro_final/UI/login/rounded_text_field.dart';

import '../../presentation/login/login_presenter.dart';

class LoginScreen extends StatelessWidget {
  static const String id = '/login';

  const LoginScreen({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  final LoginPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'App name',
        home: Builder(builder: (BuildContext context) {
          return Scaffold(
            backgroundColor: const Color.fromRGBO(29, 63, 55, 1),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 85,
                      backgroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSy9AccChHAl1oGZS8zTmEy0uDzHbJejPoGldBxE_Lo3RylHbznWO60Iv1DULuaCPGN3C8&usqp=CAU',
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'The Movie App',
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 28,
                      ),
                    ),
                    const SizedBox(height: 32),
                    RoundedTextField(
                      hint: 'E-mail',
                      onTextChanged: presenter.onUserEmailUpdate,
                    ),
                    const SizedBox(height: 16),
                    RoundedTextField(
                      hint: 'Senha',
                      onTextChanged: presenter.onPasswordUpdate,
                    ),
                    const SizedBox(height: 32.0),
                    RoundedButton(
                      text: 'Entrar',
                      onPressed: presenter.onLoginButtonPressed,
                    ),
                    const SizedBox(height: 8.0),
                    Obx(() {
                      final errorMessage = presenter.errorMessage.value;
                      return errorMessage.isNotEmpty
                          ? Text(errorMessage,
                              style: const TextStyle(color: Colors.white))
                          : Container();
                    }),
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
