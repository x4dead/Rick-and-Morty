import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/data/rest/src/rest_client.dart';
import 'package:rick_and_morty/models/models.dart';
import 'package:rick_and_morty/modules/signal_service/characters_ref/characters_state_ref.dart';

class CharactersNotifer extends StateNotifier<CharactersStateRef> {
  CharactersNotifer() : super(CharactersStateRef());

  Future<RestAllCharacters> getAllCharacters({required int pages}) async {
    final restCharacters = await RestClient().getAllCharacters(page: pages);
    state = state.copyWith(characters: restCharacters);
    return restCharacters;
  }

  Future<List<RestSingleCharacter>?> searchCharacters(String text) async {
    List<RestSingleCharacter>? searchedCharacters = [];

    await Future.delayed(const Duration(milliseconds: 400));

    state.characters?.characters?.where((e) {
      if ((e.name?.toLowerCase().contains(text.toLowerCase()) ?? false) &&
          text.isNotEmpty) {
        searchedCharacters.add(e);
      }
      return false;
    }).toList();

    return searchedCharacters;
  }

  void clearCharactersList() =>
      state = state.copyWith(characters: RestAllCharacters());
}
