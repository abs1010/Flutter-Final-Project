import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_cadastro_final/UI/movies_screen.dart';
import 'package:projeto_cadastro_final/main/pages/movies_presenter_factory.dart';
import 'package:projeto_cadastro_final/presentation/movies/movies_presenter.dart';

Widget makeMoviesScreen() {
  final presenter = Get.put<MoviesPresenter>(makeMoviesPresenter());

  return MoviesScreen(
    presenter: presenter,
  );
}
