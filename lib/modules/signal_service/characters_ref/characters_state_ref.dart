import 'package:rick_and_morty/models/models.dart';

class CharactersStateRef {
  bool isLoading;
  RestAllCharacters? characters;
  List<RestSingleCharacter>? searchedCharacters;

  CharactersStateRef({
    this.isLoading = false,
    this.characters,
    this.searchedCharacters,
  });

  CharactersStateRef copyWith({
    bool? isLoading,
    RestAllCharacters? characters,
    List<RestSingleCharacter>? searchedCharacters,
  }) {
    return CharactersStateRef(
      isLoading: isLoading ?? this.isLoading,
      characters: characters ?? this.characters,
      searchedCharacters: searchedCharacters ?? this.searchedCharacters,
    );
  }
}
