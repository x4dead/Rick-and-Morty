import 'package:flutter/material.dart';

import '../../data/models/Character model/character_model.dart';
import '../../themes/text_styly/app_text_style.dart';

class CharactersGridWidget extends StatelessWidget {
  const CharactersGridWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final CharacterModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(
          maxRadius: 61,
          child: Image.asset(model.image),
        ),
        const SizedBox(height: 18),
        model.status,
        Text(model.name, style: AppTextStyle.w500s16),
        Text(model.species, style: AppTextStyle.w400s12),
      ],
    );
  }
}
