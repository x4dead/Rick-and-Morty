import 'dart:convert';

import 'package:rick_and_morty/models/models.dart';

class RestAllEpisodes {
    final Info? info;
    final List<Result>? results;

    RestAllEpisodes({
        this.info,
        this.results,
    });

    RestAllEpisodes copyWith({
        Info? info,
        List<Result>? results,
    }) => 
        RestAllEpisodes(
            info: info ?? this.info,
            results: results ?? this.results,
        );

    factory RestAllEpisodes.fromJson(String str) => RestAllEpisodes.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory RestAllEpisodes.fromMap(Map<String, dynamic> json) => RestAllEpisodes(
        info: json["info"] == null ? null : Info.fromMap(json["info"]),
        results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "info": info?.toMap(),
        "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toMap())),
    };
}



class Result {
    final int? id;
    final String? name;
    final String? airDate;
    final String? episode;
    final List<String>? characters;
    final String? url;
    final String? created;

    Result({
        this.id,
        this.name,
        this.airDate,
        this.episode,
        this.characters,
        this.url,
        this.created,
    });

    Result copyWith({
        int? id,
        String? name,
        String? airDate,
        String? episode,
        List<String>? characters,
        String? url,
        String? created,
    }) => 
        Result(
            id: id ?? this.id,
            name: name ?? this.name,
            airDate: airDate ?? this.airDate,
            episode: episode ?? this.episode,
            characters: characters ?? this.characters,
            url: url ?? this.url,
            created: created ?? this.created,
        );

    factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Result.fromMap(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        airDate: json["air_date"],
        episode: json["episode"],
        characters: json["characters"] == null ? [] : List<String>.from(json["characters"]!.map((x) => x)),
        url: json["url"],
        created: json["created"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "air_date": airDate,
        "episode": episode,
        "characters": characters == null ? [] : List<dynamic>.from(characters!.map((x) => x)),
        "url": url,
        "created": created,
    };
}
