import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/models.dart';
import 'package:rick_and_morty/themes/colors/app_colors.dart';
import 'package:rick_and_morty/themes/text_styly/app_text_style.dart';
import 'package:rick_and_morty/utils/constants/ui_constants.dart';
import 'package:rick_and_morty/utils/converting.dart';
import 'package:rick_and_morty/utils/inkwell_transparent.dart';
import 'package:rick_and_morty/widgets/custom_list_tile.dart';
import 'chat_info_header.dart';

class CharacterInfoPage extends StatelessWidget {
  const CharacterInfoPage({Key? key, required this.model}) : super(key: key);

  final Character model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color0B1E2D,
      body: CustomScrollView(slivers: [
        SliverPersistentHeader(
          delegate: ChatInfoHeader(model.image!, expandedHeight: 218),
          pinned: true,
        ),
        SliverList(
          delegate: SliverChildListDelegate.fixed([
            // kSBH40,
            // kSBH50,
            _PersonalInfo(
              model: model,
            ),
            const Divider(color: AppColors.color152A3A, thickness: 2),
            kSBH36,
            Row(
              children: [
                kSBW16,
                Text(
                  'Эпизоды',
                  style: AppTextStyle.w500s20,
                ),
                const Spacer(),
                Text(
                  'Все эпизоды',
                  style: AppTextStyle.w400s12nB,
                ),
                kSBW16,
              ],
            ),
            kSBH24,
          ]),
        )
      ]),
    );
  }
}

class _PersonalInfo extends StatelessWidget {
  const _PersonalInfo({
    Key? key,
    required this.model,
  }) : super(key: key);
  final Character model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 90, 16, 34),
      child: Column(
        children: [
          Text(
            model.name!,
            textAlign: TextAlign.center,
            style: AppTextStyle.w400s34,
          ),
          const SizedBox(height: 4),
          Text(
            model.status!.toUpperCase(),
            style: AppTextStyle.w500s10
                .copyWith(color: Converting().getStatusColor(model.status!)),
          ),
          const SizedBox(height: 30),
          // Text(
          //   model.bio!,
          //   style:
          //       AppTextStyle.w400s14.copyWith(wordSpacing: 0.5, height: 1.35),
          // ),
          // const SizedBox(height: 30),
          Row(
            children: [
              CategoryWidget(title: 'Пол', name: model.gender!),
              const Spacer(),
              CategoryWidget(title: 'Расса', name: model.species!),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 20),
          LocationInfo(name: model.origin!.name!),
          const SizedBox(height: 24),
          LocationInfo(
            title: 'Местоположение',
            name: model.location!.name!,
          ),
        ],
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.title,
    required this.name,
  });
  final String title;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.w400s12nB,
        ),
        kSBH4,
        Text(
          name,
          style: AppTextStyle.w400s14,
        ),
      ],
    );
  }
}

class LocationInfo extends StatelessWidget {
  const LocationInfo({
    this.title = 'Место рождения',
    required this.name,
    Key? key,
    this.onTap,
  }) : super(key: key);

  final String title;
  final String name;
  final VoidCallback? onTap;

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
          onPressed: onTap,
          icon: const Icon(
            Icons.keyboard_arrow_right_rounded,
            color: AppColors.colorFFFFFF,
          ),
        ),
      ],
    );
  }
}
