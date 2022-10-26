﻿import 'package:flutter/material.dart';
// import 'package:rick_and_morty/data/models/Character%20model/character_model.dart';
import 'package:rick_and_morty/themes/colors/app_colors.dart';
import 'package:rick_and_morty/themes/text_styly/app_text_style.dart';
import '../../../models/character_model/character_model.dart';
import 'Shapka-Ava/shapka_ava.dart';

class AllInfoCharacter extends StatelessWidget {
  const AllInfoCharacter({Key? key, required this.model}) : super(key: key);

  final Results model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color0B1E2D,
      body: CustomScrollView(slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              ShapkaAva(image: model.image!),
              PersonalInfo(
                place: model.gender!,
                bio: model.gender!,
                gender: model.gender!,
                name: model.name!,
                species: model.species!,
                status: model.status!,
              ),
              const Divider(color: AppColors.color152A3A, thickness: 2),
            ],
          ),
        ),
      ]),
    );
  }
}

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({
    Key? key,
    required this.name,
    required this.status,
    required this.bio,
    required this.gender,
    required this.species,
    required this.place,
  }) : super(key: key);
  final String name;
  final String status;
  final String bio;
  final String gender;
  final String species;
  final String place;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        children: [
          Text(
            name,
            style: AppTextStyle.w400s34,
          ),
          const SizedBox(height: 4),
          Text(status),
          const SizedBox(height: 30),
          Text(
            bio,
            style:
                AppTextStyle.w400s14.copyWith(wordSpacing: 0.5, height: 1.35),
          ),
          const SizedBox(height: 30),
          Row(
            children: const [
              Text(
                'Пол',
                style: AppTextStyle.w400s12nB,
              ),
              SizedBox(width: 156),
              Text(
                'Расса',
                style: AppTextStyle.w400s12nB,
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text(
                gender,
                style: AppTextStyle.w400s14,
              ),
              const SizedBox(width: 118),
              Text(
                species,
                style: AppTextStyle.w400s14,
              ),
            ],
          ),
          const SizedBox(height: 20),
          LocationInfo(name: place),
          const SizedBox(height: 24),
          const LocationInfo(
            title: 'Местоположение',
            name: 'Земля (Измерение подменны)',
          ),
        ],
      ),
    );
  }
}

class LocationInfo extends StatelessWidget {
  const LocationInfo({
    this.title = 'Место рождения',
    required this.name,
    Key? key,
  }) : super(key: key);

  final String title;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppTextStyle.w400s12nB),
            const SizedBox(height: 2.5),
            Text(name, style: AppTextStyle.w400s14),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.keyboard_arrow_right_rounded,
            color: AppColors.colorFFFFFF,
          ),
        ),
      ],
    );
  }
}
