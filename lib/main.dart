import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_cadastro_final/UI/movies_screen.dart';
import 'package:projeto_cadastro_final/main/pages/movies_screen_factory.dart';
//import 'package:flutter_native_splash/flutter_native_splash.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';

void main() async {
  //WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Projeto Final TMDB',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: MoviesScreen.id,
      getPages: [GetPage(name: MoviesScreen.id, page: makeMoviesScreen)],
    );
  }
}
