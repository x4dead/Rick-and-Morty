﻿import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/models.dart';
import 'package:rick_and_morty/themes/colors/app_colors.dart';
import 'package:rick_and_morty/widgets/custom_list_tile.dart';
import '../../pages/more_info_screen/character info/all_info_character.dart';
import '../../themes/text_styly/app_text_style.dart';

class CharacterListTile extends StatelessWidget {
  const CharacterListTile({Key? key, required this.results}) : super(key: key);

  final RestSingleCharacter results;

  @override
  Widget build(BuildContext context) {
    statusColor() {
      switch (results.status?.toLowerCase()) {
        case 'alive':
          return AppColors.color43D049;
        case 'dead':
          return AppColors.colorEB5757;
        default:
          return AppColors.color5B6975;
      }
    }

    return IntrinsicHeight(
      child: CustomListTile(
        leadingHeight: 74,
        leadingWidth: 74,
        horizontalTitleGap: 18,
        topOverlineGap: 0,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        title: (results.status ?? '').toUpperCase(),
        titleStyle: AppTextStyle.w500s10green.copyWith(color: statusColor()),
        leadingUrl: results.image!,
        subTitle: results.name!,
        subTitleStyle: AppTextStyle.w500s16,
        overline: '${results.species}, ${results.gender}',
        overlineStyle: AppTextStyle.w400s12,
      ),
    );
    InkWell(
      onTap: () {
        Navigator.of(context).push(
          CupertinoPageRoute(
            builder: (context) => AllInfoCharacter(model: results),
          ),
        );
      },
      child: SizedBox(
        height: 74,
        child: Row(
          children: [
            SizedBox(
              child: CircleAvatar(
                maxRadius: 37,
                minRadius: 37,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      results.image!,
                      cacheHeight: 200,
                      cacheWidth: 200,
                    )),
              ),
            ),
            const SizedBox(width: 18),
            Padding(
              padding: const EdgeInsets.only(bottom: 9, top: 9),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(results.status ?? ''),
                  Text(results.name!, style: AppTextStyle.w500s16),
                  Text('${results.species}, ${results.gender}',
                      style: AppTextStyle.w400s12),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}