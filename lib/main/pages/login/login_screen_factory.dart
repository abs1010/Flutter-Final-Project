import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../UI/login/login_screen.dart';
import '../../../presentation/login/login_presenter.dart';
import 'login_presenter_factory.dart';

Widget makeLoginScreen() {
  Get.put(makeLoginPresenter());
  return LoginScreen(presenter: Get.find<LoginPresenter>());
}