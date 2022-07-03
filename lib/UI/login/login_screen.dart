
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundedTextField(
                hint: 'Email',
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
              Obx(() {
                final errorMessage = presenter.errorMessage.value;
                return errorMessage.isNotEmpty
                    ? Text(errorMessage)
                    : Container();
              }),
            ],
          ),
        ),
      ),
    );
  }
}
