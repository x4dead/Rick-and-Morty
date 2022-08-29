import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/data/models/Character%20model/character_model.dart';
import 'package:rick_and_morty/images.dart';
import 'package:rick_and_morty/themes/colors/app_colors.dart';
import 'package:rick_and_morty/themes/text_styly/app_text_style.dart';

class MoreInfoScreen extends StatelessWidget {
  const MoreInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CharacterModel>();
    return Scaffold(
      backgroundColor: AppColors.color0B1E2D,
      body: CustomScrollView(slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              const ShapkaAva(),
              PersonalInfo(
                bio: vm.bio,
                gender: vm.gender,
                name: vm.name,
                species: vm.species,
                status: vm.status,
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
  }) : super(key: key);
  final String name;
  final Text status;
  final String bio;
  final String gender;
  final String species;

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
          Text(
            status.toUpperCase(),
            style: AppTextStyle.w500s10green,
          ),
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
              const SizedBox(width: 156),
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
          const LocationInfo(),
          const SizedBox(height: 24),
          const LocationInfo(
            title: 'Местоположение',
            name: 'Земля (Измерение подменны)',
          ),
          // const SizedBox(height: 36),
        ],
      ),
    );
  }
}

class LocationInfo extends StatelessWidget {
  const LocationInfo({
    this.title = 'Место рождения',
    this.name = 'Земля C-137',
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

class ShapkaAva extends StatelessWidget {
  const ShapkaAva({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SizedBox(height: 300),
        Image.asset(AppImages.shapka),
        Positioned(
          left: 24,
          top: 58,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(AppImages.arrowBack),
          ),
        ),
        Positioned(
          top: 138,
          left: 115,
          child: CircleAvatar(
            radius: 86,
            backgroundColor: AppColors.color0B1E2D,
            child: Image.asset(
              AppImages.rick,
              scale: 2,
            ),
          ),
        ),
      ],
    );
  }
}
