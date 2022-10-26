import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

import '../../images.dart';

import '../../screens/Episodes/episode_screen.dart';
import '../../screens/Location/location_screen.dart';
import '../../screens/all _character/all_character_screen.dart';
import '../character_model/character_model.dart';

class CharacterRepo {
  final getChars = 'https://rickandmortyapi.com/api/character';
  final getLocats = 'https://rickandmortyapi.com/api/location';

  // Future<CharacterModel> getLocation() async {
  //   try {
  //     final response =
  //         await http.get(Uri.parse('$getChars?pages=$pages&name=$name'));
  //     final result = json.decode(response.body);
  //     return CharacterModel.fromJson(result);
  //   } catch (e) {
  //     throw Exception(e.toString());
  //   }
  // }

  Future<CharacterModel> getCharacter(
    int pages,
    String name,
  ) async {
    try {
      final response =
          await http.get(Uri.parse('$getChars?pages=$pages&name=$name'));
      final result = json.decode(response.body);
      return CharacterModel.fromJson(result);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // final characterBloc = CharacterBloc(characterRepo: CharacterRepo());
  final bool isActivated = true;

  List<Widget> screens = [
    const AllCharacterScreen(),
    const LocationScreen(),
    const EpisodeScreen(),
  ];

  SvgPicture list = SvgPicture.asset(AppImages.list);
  SvgPicture grid = SvgPicture.asset(AppImages.grid);

  // ListView listViewCharacter = ListView.separated(
  //   physics: const NeverScrollableScrollPhysics(),
  //   shrinkWrap: true,
  //   itemCount: 7,
  //   itemBuilder: (context, index) => CharacterListWidget(
  //       results: BlocProvider.of<CharacterBloc>(context)
  //           .allCharacters[index]
  //           .results![index]),
  //   separatorBuilder: (context, index) => const SizedBox(height: 24),
  // );

  // GridView gridView = GridView.builder(
  //   itemCount: 7,
  //   shrinkWrap: true,
  //   physics: const NeverScrollableScrollPhysics(),
  //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //       crossAxisCount: 2,
  //       mainAxisSpacing: 24,
  //       crossAxisSpacing: 16,
  //       childAspectRatio: 0.85),
  //   itemBuilder: (context, index) => CharactersGridWidget(
  //     model: BlocProvider.of<CharacterBloc>(context)
  //         .allCharacters[index]
  //         .results![index],
  //   ),
  // );
}
