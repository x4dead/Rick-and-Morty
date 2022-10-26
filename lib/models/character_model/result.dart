// part of 'character_model.dart';

// class Results {
//   final int id;
//   final String name;
//   final String status;
//   final String species;
//   final String type;
//   final String gender;
//   final CharacterLocation origin;
//   final CharacterLocation location;
//   final String image;
//   final List<String> episode;
//   final String url;
//   final String created;

//   Results({
//     required this.id,
//     required this.name,
//     required this.status,
//     required this.species,
//     required this.type,
//     required this.gender,
//     required this.origin,
//     required this.location,
//     required this.image,
//     required this.episode,
//     required this.url,
//     required this.created,
//   });

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'id': id,
//       'name': name,
//       'status': status,
//       'species': species,
//       'type': type,
//       'gender': gender,
//       'origin': origin.toMap(),
//       'location': location.toMap(),
//       'image': image,
//       'episode': episode,
//       'url': url,
//       'created': created,
//     };
//   }

//   factory Results.fromJson(Map<String, dynamic> json) => Results(
//         id: json["id"],
//         name: json["name"],
//         status: json["status"],
//         species: json["species"],
//         type: json["type"],
//         gender: json["gender"],
//         origin: (json["origin"]),
//         location: CharacterLocation.fromJson(json["location"]),
//         image: json["image"],
//         episode: List<String>.from(json["episode"].map((x) => x)),
//         url: json["url"],
//         created: json["created"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "status": status,
//         "species": species,
//         "type": type,
//         "gender": gender,
//         "origin": origin.toJson(),
//         "location": location.toJson(),
//         "image": image,
//         "episode": List<dynamic>.from(episode.map((x) => x)),
//         "url": url,
//         "created": created,
//       };

//   factory Results.fromMap(Map<String, dynamic> map) {
//     return Results(
//       id: map['id'] as int,
//       name: map['name'] as String,
//       status: map['status'] as String,
//       species: map['species'] as String,
//       type: map['type'] as String,
//       gender: map['gender'] as String,
//       origin: CharacterLocation.fromMap(map['origin'] as Map<String, dynamic>),
//       location:
//           CharacterLocation.fromMap(map['location'] as Map<String, dynamic>),
//       image: map['image'] as String,
//       episode: List<String>.from(
//         (map['episode'] as List<String>),
//       ),
//       url: map['url'] as String,
//       created: map['created'] as String,
//     );
//   }

//   Results copyWith({
//     int? id,
//     String? name,
//     String? status,
//     String? species,
//     String? type,
//     String? gender,
//     CharacterLocation? origin,
//     CharacterLocation? location,
//     String? image,
//     List<String>? episode,
//     String? url,
//     String? created,
//   }) {
//     return Results(
//       id: id ?? this.id,
//       name: name ?? this.name,
//       status: status ?? this.status,
//       species: species ?? this.species,
//       type: type ?? this.type,
//       gender: gender ?? this.gender,
//       origin: origin ?? this.origin,
//       location: location ?? this.location,
//       image: image ?? this.image,
//       episode: episode ?? this.episode,
//       url: url ?? this.url,
//       created: created ?? this.created,
//     );
//   }

//   @override
//   String toString() {
//     return 'Results(id: $id, name: $name, status: $status, species: $species, type: $type, gender: $gender, origin: $origin, location: $location, image: $image, episode: $episode, url: $url, created: $created)';
//   }

//   @override
//   bool operator ==(covariant Results other) {
//     if (identical(this, other)) return true;

//     return other.id == id &&
//         other.name == name &&
//         other.status == status &&
//         other.species == species &&
//         other.type == type &&
//         other.gender == gender &&
//         other.origin == origin &&
//         other.location == location &&
//         other.image == image &&
//         listEquals(other.episode, episode) &&
//         other.url == url &&
//         other.created == created;
//   }

//   @override
//   int get hashCode {
//     return id.hashCode ^
//         name.hashCode ^
//         status.hashCode ^
//         species.hashCode ^
//         type.hashCode ^
//         gender.hashCode ^
//         origin.hashCode ^
//         location.hashCode ^
//         image.hashCode ^
//         episode.hashCode ^
//         url.hashCode ^
//         created.hashCode;
//   }
// }
