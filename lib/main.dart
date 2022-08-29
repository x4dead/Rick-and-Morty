import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/data/provider/characters_provider.dart';
import 'package:rick_and_morty/screens/HomePage/home_page.dart';
import 'package:rick_and_morty/screens/More%20info%20screen/more_info_screen.dart';
import 'package:rick_and_morty/screens/Splash%20screen/splash_screen.dart';
// import 'package:rick_and_morty/themes/colors/app_colors.dart';

// import 'images.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CharactersProvider(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Rick And Morty last mission',
          initialRoute: '/',
          routes: {
            '/': (context) => const SplashScreen(),
            '/HomePage': (context) => const HomePage(),
            '/MoreInfoScreen': (context) => const MoreInfoScreen(),
          }),
    );
  }
}
