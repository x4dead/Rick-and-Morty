import 'dart:convert';

import 'package:rick_and_morty/models/src/character_models/single_character.dart';

class RestAllCharacters {
  final Info? info;
  final List<RestSingleCharacter>? characters;

  RestAllCharacters({
    this.info,
    this.characters,
  });

  RestAllCharacters copyWith({
    Info? info,
    List<RestSingleCharacter>? characters,
  }) =>
      RestAllCharacters(
        info: info ?? this.info,
        characters: characters ?? this.characters,
      );

  factory RestAllCharacters.fromJson(String str) =>
      RestAllCharacters.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RestAllCharacters.fromMap(Map<String, dynamic> json) =>
      RestAllCharacters(
        info: json["info"] == null ? null : Info.fromMap(json["info"]),
        characters: json["results"] == null
            ? []
            : List<RestSingleCharacter>.from(
                json["results"]!.map((x) => RestSingleCharacter.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "info": info?.toMap(),
        "results": characters == null
            ? []
            : List<dynamic>.from(characters!.map((x) => x.toMap())),
      };
}

class Info {
  final int? count;
  final int? pages;
  final String? next;
  final String? prev;

  Info({
    this.count,
    this.pages,
    this.next,
    this.prev,
  });

  Info copyWith({
    int? count,
    int? pages,
    String? next,
    String? prev,
  }) =>
      Info(
        count: count ?? this.count,
        pages: pages ?? this.pages,
        next: next ?? this.next,
        prev: prev ?? this.prev,
      );

  factory Info.fromJson(String str) => Info.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Info.fromMap(Map<String, dynamic> json) => Info(
        count: json["count"],
        pages: json["pages"],
        next: json["next"],
        prev: json["prev"],
      );

  Map<String, dynamic> toMap() => {
        "count": count,
        "pages": pages,
        "next": next,
        "prev": prev,
      };
}
