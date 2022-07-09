import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_cadastro_final/UI/login/login_screen.dart';
import 'package:projeto_cadastro_final/UI/movies/movies_screen.dart';
import 'package:projeto_cadastro_final/main/pages/movies/movies_screen_factory.dart';
import 'firebase_options.dart';
import 'main/pages/login/login_screen_factory.dart';
//import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
      runApp(const MyApp(
        shouldShowLogin: true,
      ));
    } else {
      print('User is signed in!');
      runApp(const MyApp(
        shouldShowLogin: false,
      ));
    }
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.shouldShowLogin}) : super(key: key);

  final bool shouldShowLogin;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var initialRoute = shouldShowLogin ? LoginScreen.id : MoviesScreen.id;

    return GetMaterialApp(
      title: 'Projeto Final TMDB',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: initialRoute,
      getPages: [
        GetPage(name: LoginScreen.id, page: makeLoginScreen),
        GetPage(name: MoviesScreen.id, page: makeMoviesScreen),
      ],
    );
  }
}
