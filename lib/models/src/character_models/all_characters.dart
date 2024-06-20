import 'dart:convert';

import 'package:rick_and_morty/models/src/character_models/character.dart';

class AllCharacters {
  final Info? info;
  final List<Character>? characters;

  AllCharacters({
    this.info,
    this.characters,
  });

  AllCharacters copyWith({
    Info? info,
    List<Character>? characters,
  }) =>
      AllCharacters(
        info: info ?? this.info,
        characters: characters ?? this.characters,
      );

  factory AllCharacters.fromJson(String str) =>
      AllCharacters.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AllCharacters.fromMap(Map<String, dynamic> json) => AllCharacters(
        info: json["info"] == null ? null : Info.fromMap(json["info"]),
        characters: json["results"] == null
            ? []
            : List<Character>.from(
                json["results"]!.map((x) => Character.fromMap(x))),
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
