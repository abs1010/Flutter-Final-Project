import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_cadastro_final/UI/movies_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto_cadastro_final/main/pages/movies_presenter_factory.dart';
import 'package:projeto_cadastro_final/main/pages/movies_screen_factory.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
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

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(
                  'https://miro.medium.com/max/1400/0*vowtRZE_wvyVA7CB',
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Marcelo Montanher',
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 28,
                ),
              ),
              const SizedBox(height: 32),
              HomeButton(
                icon: Icons.phone_android,
                text: '11 12345-6789',
                onPressed: () {},
              ),
              const SizedBox(height: 16),
              HomeButton(
                icon: Icons.email,
                text: 'teste@gmail.com',
                onPressed: () {
                  final uri = Uri(
                    scheme: 'mailto',
                    path: 'teste@gmail.com',
                  );
                  launchUrl(uri);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeButton extends StatelessWidget {
  const HomeButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(1000),
      elevation: 4,
      child: ListTile(
        onTap: onPressed,
        leading: Icon(
          icon,
          color: Colors.teal,
        ),
        title: Text(
          text,
          style: const TextStyle(color: Colors.teal),
        ),
      ),
    );
  }
}
