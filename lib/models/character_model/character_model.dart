// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

// import 'package:flutter/foundation.dart';

// part '../character model/info.dart';
// part '../character model/result.dart';

// class CharacterModel {
//   final Info info;
//   final List<Results> result;
//   CharacterModel({
//     required this.info,
//     required this.result,
//   });

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'info': info.toMap(),
//       'result': result.map((x) => x.toMap()).toList(),
//     };
//   }

//   factory CharacterModel.fromMap(Map<String, dynamic> map) {
//     return CharacterModel(
//       info: Info.fromMap(map['info'] as Map<String, dynamic>),
//       result: List<Results>.from(
//         (map['result'] as List<int>).map<Results>(
//           (x) => Results.fromMap(x as Map<String, dynamic>),
//         ),
//       ),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory CharacterModel.fromJson(String source) =>
//       CharacterModel.fromMap(json.decode(source) as Map<String, dynamic>);

//   CharacterModel copyWith({
//     Info? info,
//     List<Results>? result,
//   }) {
//     return CharacterModel(
//       info: info ?? this.info,
//       result: result ?? this.result,
//     );
//   }

//   @override
//   String toString() => 'CharacterModel(info: $info, result: $result)';

//   @override
//   bool operator ==(covariant CharacterModel other) {
//     if (identical(this, other)) return true;

//     return other.info == info && listEquals(other.result, result);
//   }

//   @override
//   int get hashCode => info.hashCode ^ result.hashCode;
// }
// //

// class CharacterLocation {
//   CharacterLocation({
//     required this.name,
//     required this.url,
//   });

//   final String name;
//   final String url;

//   factory CharacterLocation.fromJson(Map<String, dynamic> json) =>
//       CharacterLocation(
//         name: json["name"],
//         url: json["url"],
//       );

//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "url": url,
//       };

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'name': name,
//       'url': url,
//     };
//   }

//   factory CharacterLocation.fromMap(Map<String, dynamic> map) {
//     return CharacterLocation(
//       name: map['name'] as String,
//       url: map['url'] as String,
//     );
//   }

//   CharacterLocation copyWith({
//     String? name,
//     String? url,
//   }) {
//     return CharacterLocation(
//       name: name ?? this.name,
//       url: url ?? this.url,
//     );
//   }

//   @override
//   String toString() => 'CharacterLocation(name: $name, url: $url)';

//   @override
//   bool operator ==(covariant CharacterLocation other) {
//     if (identical(this, other)) return true;

//     return other.name == name && other.url == url;
//   }

//   @override
//   int get hashCode => name.hashCode ^ url.hashCode;
// }

//
class CharacterModel {
  Info? info;
  List<Results>? results;

  CharacterModel({this.info, this.results});

  CharacterModel.fromJson(Map<String, dynamic> json) {
    info = json['info'] != null ? Info.fromJson(json['info']) : null;
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.info != null) {
      data['info'] = this.info!.toJson();
    }
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Info {
  int? count;
  int? pages;
  String? next;
  Null? prev;

  Info({this.count, this.pages, this.next, this.prev});

  Info.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    pages = json['pages'];
    next = json['next'];
    prev = json['prev'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['pages'] = this.pages;
    data['next'] = this.next;
    data['prev'] = this.prev;
    return data;
  }
}

class Results {
  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  Origin? origin;
  Origin? location;
  String? image;
  List<String>? episode;
  String? url;
  String? created;

  Results(
      {this.id,
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
      this.created});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    species = json['species'];
    type = json['type'];
    gender = json['gender'];
    origin =
        json['origin'] != null ? new Origin.fromJson(json['origin']) : null;
    location =
        json['location'] != null ? new Origin.fromJson(json['location']) : null;
    image = json['image'];
    episode = json['episode'].cast<String>();
    url = json['url'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['species'] = this.species;
    data['type'] = this.type;
    data['gender'] = this.gender;
    if (this.origin != null) {
      data['origin'] = this.origin!.toJson();
    }
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['image'] = this.image;
    data['episode'] = this.episode;
    data['url'] = this.url;
    data['created'] = this.created;
    return data;
  }
}

class Origin {
  String? name;
  String? url;

  Origin({this.name, this.url});

  Origin.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}
