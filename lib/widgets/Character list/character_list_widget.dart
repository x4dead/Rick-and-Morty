import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/data/provider/characters_provider.dart';
import 'package:rick_and_morty/themes/colors/app_colors.dart';
import '../../data/models/Character model/character_model.dart';
import '../../themes/text_styly/app_text_style.dart';

class CharacterListWidget extends StatelessWidget {
  const CharacterListWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final CharacterModel model;

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CharactersProvider>();
    return SizedBox(
      height: 74,
      child: Row(
        children: [
          SizedBox(
            child: InkWell(
              overlayColor:
                  MaterialStateProperty.all(AppColors.colorTransparent),
              onTap: () {
                Navigator.pushNamed(context, '/MoreInfoScreen');
                // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
                vm.notifyListeners();
              },
              child: CircleAvatar(
                maxRadius: 37,
                minRadius: 37,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      model.image,
                      cacheHeight: 200,
                      cacheWidth: 200,
                    )),
              ),
            ),
          ),
          const SizedBox(width: 18),
          Padding(
            padding: const EdgeInsets.only(bottom: 9, top: 9),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                model.status,
                Text(model.name, style: AppTextStyle.w500s16),
                Text(model.species, style: AppTextStyle.w400s12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
