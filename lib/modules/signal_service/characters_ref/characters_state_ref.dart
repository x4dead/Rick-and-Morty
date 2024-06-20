import 'package:rick_and_morty/models/models.dart';

class CharactersStateRef {
  bool isLoading;
  AllCharacters? characters;
  List<Character>? searchedCharacters;

  CharactersStateRef({
    this.isLoading = false,
    this.characters,
    this.searchedCharacters,
  });

  CharactersStateRef copyWith({
    bool? isLoading,
    AllCharacters? characters,
    List<Character>? searchedCharacters,
  }) {
    return CharactersStateRef(
      isLoading: isLoading ?? this.isLoading,
      characters: characters ?? this.characters,
      searchedCharacters: searchedCharacters ?? this.searchedCharacters,
    );
  }
}
