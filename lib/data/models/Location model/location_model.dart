// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:rick_and_morty/images.dart';

class LocationModel {
  final int id;
  final String wordImage;
  final String worldName;
  final String reality;

  LocationModel({
    required this.id,
    required this.wordImage,
    required this.worldName,
    required this.reality,
  });

  LocationModel copyWith({
    int? id,
    String? wordImage,
    String? worldName,
    String? reality,
  }) {
    return LocationModel(
      id: id ?? this.id,
      wordImage: wordImage ?? this.wordImage,
      worldName: worldName ?? this.worldName,
      reality: reality ?? this.reality,
    );
  }

  @override
  String toString() {
    return 'LocationModel(id: $id, wordImage: $wordImage, worldName: $worldName, reality: $reality)';
  }

  @override
  bool operator ==(covariant LocationModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.wordImage == wordImage &&
        other.worldName == worldName &&
        other.reality == reality;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        wordImage.hashCode ^
        worldName.hashCode ^
        reality.hashCode;
  }
}

// ignore: non_constant_identifier_names
final LocationInfoData = <LocationModel>[
  LocationModel(
    id: 1,
    wordImage: AppImages.earthC137,
    worldName: 'Земля C-137',
    reality: 'С-137',
  ),
  LocationModel(
    id: 2,
    wordImage: AppImages.anatomyPark,
    worldName: 'Анатомический парк',
    reality: 'С-137',
  ),
  LocationModel(
    id: 3,
    wordImage: AppImages.pluton,
    worldName: 'Плутон',
    reality: 'С-137',
  ),
  LocationModel(
    id: 4,
    wordImage: AppImages.citadel,
    worldName: 'Цитадель Риков',
    reality: 'UNKNOW',
  ),
];
