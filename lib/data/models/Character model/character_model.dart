// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/cupertino.dart';

import 'package:rick_and_morty/images.dart';
import 'package:rick_and_morty/themes/text_styly/app_text_style.dart';

class CharacterModel {
  final int id;
  final String name;
  final Text status;
  final String species;

  final String gender;
  final String image;
  final String created;
  final String bio;

  CharacterModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.image,
    required this.created,
    required this.bio,
  });

  CharacterModel copyWith({
    int? id,
    String? name,
    Text? status,
    String? species,
    String? gender,
    String? image,
    String? created,
    String? bio,
  }) {
    return CharacterModel(
      id: id ?? this.id,
      name: name ?? this.name,
      status: status ?? this.status,
      species: species ?? this.species,
      gender: gender ?? this.gender,
      image: image ?? this.image,
      created: created ?? this.created,
      bio: bio ?? this.bio,
    );
  }

  @override
  String toString() {
    return 'CharacterModel(id: $id, name: $name, status: $status, species: $species, gender: $gender, image: $image, created: $created, bio: $bio)';
  }

  @override
  bool operator ==(covariant CharacterModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.status == status &&
        other.species == species &&
        other.gender == gender &&
        other.image == image &&
        other.created == created &&
        other.bio == bio;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        status.hashCode ^
        species.hashCode ^
        gender.hashCode ^
        image.hashCode ^
        created.hashCode ^
        bio.hashCode;
  }
}

// ignore: non_constant_identifier_names
final AllInfoData = <CharacterModel>[
  CharacterModel(
    id: 1,
    name: 'Рик Санчез',
    status: Text('Живой'.toUpperCase(), style: AppTextStyle.w500s10green),
    species: 'Человек',
    gender: 'Мужской',
    image: AppImages.rick,
    created: '2017-11-04T18:48:46.250Z',
    bio:
        'Главный протагонист мультсериала «Рик и Морти». Безумный ученый, чей алкоголизм, безрассудность и социопатия заставляют беспокоиться семью его дочери.',
  ),
  CharacterModel(
      id: 2,
      name: 'Директор Агентства',
      status: Text('Живой'.toUpperCase(), style: AppTextStyle.w500s10green),
      species: 'Человек, Мужской',
      gender: 'Мужской',
      image: AppImages.director,
      created: '2017-11-04T18:50:21.651Z',
      bio: 'Директор Агентства'),
  CharacterModel(
      id: 3,
      name: 'Морти Смит',
      status: Text('Живой'.toUpperCase(), style: AppTextStyle.w500s10green),
      species: 'Человек, Мужской',
      gender: 'Мужской',
      image: AppImages.morty,
      created: '2017-11-04T18:50:21.651Z',
      bio: 'Морти Смит'),
  CharacterModel(
      id: 4,
      name: 'Саммер Смит',
      status: Text('Живой'.toUpperCase(), style: AppTextStyle.w500s10green),
      species: 'Человек, Женский',
      gender: 'Женский',
      image: AppImages.samer,
      created: '2017-11-04T18:50:21.651Z',
      bio: 'Саммер Смит'),
  CharacterModel(
      id: 5,
      name: 'Альберт Эйнштейн',
      status: Text('Мертвый'.toUpperCase(), style: AppTextStyle.w500s10red),
      species: 'Человек, Мужской',
      gender: 'Мужской',
      image: AppImages.rickDed,
      created: '2017-11-04T18:50:21.651Z',
      bio: 'Альберт Эйнштейн'),
  CharacterModel(
      id: 6,
      name: 'Алан Рейлс',
      status: Text('Мертвый'.toUpperCase(), style: AppTextStyle.w500s10red),
      species: 'Человек, Мужской',
      gender: 'Мужской',
      image: AppImages.alan,
      created: '2017-11-04T18:50:21.651Z',
      bio: 'Алан Рейлс'),
  CharacterModel(
      id: 7,
      name: 'Злой Морти',
      status: Text('Живой'.toUpperCase(), style: AppTextStyle.w500s10green),
      species: 'Человек, Мужской',
      gender: 'Мужской',
      image: AppImages.zloyMorty,
      created: '2017-11-04T18:50:21.651Z',
      bio: 'Злой Морти'),
];
