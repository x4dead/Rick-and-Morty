import 'package:flutter/material.dart';
// import 'package:rick_and_morty/screens/More%20info%20screen/character%20info/all_info_character.dart';

// import '../../data/models/Character model/character_model.dart';
// import '../../models/character model/character_model.dart';
import '../../models/character_model/character_model.dart';
import '../../screens/more_info_screen/character info/all_info_character.dart';
import '../../themes/text_styly/app_text_style.dart';

class CharactersGridWidget extends StatelessWidget {
  const CharactersGridWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final Results model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AllInfoCharacter(model: model),
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            maxRadius: 61,
            minRadius: 61,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                model.image!,
                cacheHeight: 200,
                cacheWidth: 200,
              ),
            ),
          ),
          const SizedBox(height: 18),
          Text(model.status!),
          Text(model.name!, style: AppTextStyle.w500s16),
          Text('${model.species}, ${model.gender}',
              style: AppTextStyle.w400s12),
        ],
      ),
    );
  }
}
