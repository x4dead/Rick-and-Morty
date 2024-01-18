import 'dart:convert';

class RestSingleLocation {
    final int? id;
    final String? name;
    final String? type;
    final String? dimension;
    final List<String>? residents;
    final String? url;
    final String? created;

    RestSingleLocation({
        this.id,
        this.name,
        this.type,
        this.dimension,
        this.residents,
        this.url,
        this.created,
    });

    RestSingleLocation copyWith({
        int? id,
        String? name,
        String? type,
        String? dimension,
        List<String>? residents,
        String? url,
        String? created,
    }) => 
        RestSingleLocation(
            id: id ?? this.id,
            name: name ?? this.name,
            type: type ?? this.type,
            dimension: dimension ?? this.dimension,
            residents: residents ?? this.residents,
            url: url ?? this.url,
            created: created ?? this.created,
        );

    factory RestSingleLocation.fromJson(String str) => RestSingleLocation.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory RestSingleLocation.fromMap(Map<String, dynamic> json) => RestSingleLocation(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        dimension: json["dimension"],
        residents: json["residents"] == null ? [] : List<String>.from(json["residents"]!.map((x) => x)),
        url: json["url"],
        created: json["created"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "type": type,
        "dimension": dimension,
        "residents": residents == null ? [] : List<dynamic>.from(residents!.map((x) => x)),
        "url": url,
        "created": created,
    };
}
