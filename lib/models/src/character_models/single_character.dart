import 'dart:convert';

class RestSingleCharacter {
  final int? id;
  final String? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;
  final CharacterLocation? origin;
  final CharacterLocation? location;
  final String? image;
  final List<String>? episode;
  final String? url;
  final String? created;

  RestSingleCharacter({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.origin,
    this.location,
    this.image,
    this.episode,
    this.url,
    this.created,
  });

  RestSingleCharacter copyWith({
    int? id,
    String? name,
    String? status,
    String? species,
    String? type,
    String? gender,
    CharacterLocation? origin,
    CharacterLocation? location,
    String? image,
    List<String>? episode,
    String? url,
    String? created,
  }) =>
      RestSingleCharacter(
        id: id ?? this.id,
        name: name ?? this.name,
        status: status ?? this.status,
        species: species ?? this.species,
        type: type ?? this.type,
        gender: gender ?? this.gender,
        origin: origin ?? this.origin,
        location: location ?? this.location,
        image: image ?? this.image,
        episode: episode ?? this.episode,
        url: url ?? this.url,
        created: created ?? this.created,
      );

  factory RestSingleCharacter.fromJson(String str) =>
      RestSingleCharacter.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RestSingleCharacter.fromMap(Map<String, dynamic> json) =>
      RestSingleCharacter(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        species: json["species"],
        type: json["type"],
        gender: json["gender"],
        origin:
            json["origin"] == null ? null : CharacterLocation.fromMap(json["origin"]),
        location: json["location"] == null
            ? null
            : CharacterLocation.fromMap(json["location"]),
        image: json["image"],
        episode: json["episode"] == null
            ? []
            : List<String>.from(json["episode"]!.map((x) => x)),
        url: json["url"],
        created: json["created"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "status": status,
        "species": species,
        "type": type,
        "gender": gender,
        "origin": origin?.toMap(),
        "location": location?.toMap(),
        "image": image,
        "episode":
            episode == null ? [] : List<dynamic>.from(episode!.map((x) => x)),
        "url": url,
        "created": created,
      };
}

class CharacterLocation {
  final String? name;
  final String? url;

  CharacterLocation({
    this.name,
    this.url,
  });

  CharacterLocation copyWith({
    String? name,
    String? url,
  }) =>
      CharacterLocation(
        name: name ?? this.name,
        url: url ?? this.url,
      );

  factory CharacterLocation.fromJson(String str) => CharacterLocation.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CharacterLocation.fromMap(Map<String, dynamic> json) => CharacterLocation(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
      };
}
