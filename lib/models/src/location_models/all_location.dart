



import 'dart:convert';

import 'package:rick_and_morty/models/models.dart';

class RestAllLocation {
    final Info? info;
    final List<RestSingleLocation>? results;

    RestAllLocation({
        this.info,
        this.results,
    });

    RestAllLocation copyWith({
        Info? info,
        List<RestSingleLocation>? results,
    }) => 
        RestAllLocation(
            info: info ?? this.info,
            results: results ?? this.results,
        );

    factory RestAllLocation.fromJson(String str) => RestAllLocation.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory RestAllLocation.fromMap(Map<String, dynamic> json) => RestAllLocation(
        info: json["info"] == null ? null : Info.fromMap(json["info"]),
        results: json["results"] == null ? [] : List<RestSingleLocation>.from(json["results"]!.map((x) => RestSingleLocation.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "info": info?.toMap(),
        "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toMap())),
    };
}


