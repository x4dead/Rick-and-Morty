import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/bloc/character_bloc.dart';
import 'package:rick_and_morty/models/repository/repository.dart';
import 'package:rick_and_morty/screens/Episodes/episode_screen.dart';
import 'package:rick_and_morty/screens/Location/location_screen.dart';
import 'package:rick_and_morty/screens/home_page/home_page.dart';
import 'package:rick_and_morty/screens/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => CharacterRepo(),
      child: BlocProvider(
        create: (context) => CharacterBloc(
          characterRepo: RepositoryProvider.of<CharacterRepo>(context),
        )..add(GetCharacter('', 1)),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Rick And Morty last mission',
          initialRoute: '/',
          routes: {
            '/': (context) => const SplashScreen(),
            '/HomePage': (context) => const HomePage(),
            'LocationScreen': (context) => const LocationScreen(),
            '/EpisodeScreen': (context) => const EpisodeScreen(),
            //     MoreInfoScreen(model: vm.characters.first),
          },
        ),
      ),
    );
  }
}
