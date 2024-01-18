import 'dart:convert';

class RestSingleEpisode {
    final int? id;
    final String? name;
    final String? airDate;
    final String? episode;
    final List<String>? characters;
    final String? url;
    final String? created;

    RestSingleEpisode({
        this.id,
        this.name,
        this.airDate,
        this.episode,
        this.characters,
        this.url,
        this.created,
    });

    RestSingleEpisode copyWith({
        int? id,
        String? name,
        String? airDate,
        String? episode,
        List<String>? characters,
        String? url,
        String? created,
    }) => 
        RestSingleEpisode(
            id: id ?? this.id,
            name: name ?? this.name,
            airDate: airDate ?? this.airDate,
            episode: episode ?? this.episode,
            characters: characters ?? this.characters,
            url: url ?? this.url,
            created: created ?? this.created,
        );

    factory RestSingleEpisode.fromJson(String str) => RestSingleEpisode.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory RestSingleEpisode.fromMap(Map<String, dynamic> json) => RestSingleEpisode(
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
