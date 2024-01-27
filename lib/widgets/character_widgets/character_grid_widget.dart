import 'package:flutter/cupertino.dart';
import 'package:rick_and_morty/models/models.dart';
import 'package:rick_and_morty/utils/converting.dart';
import 'package:rick_and_morty/utils/inkwell_transparent.dart';
import 'package:rick_and_morty/widgets/custom_avatar.dart';
// import 'package:rick_and_morty/screens/More%20info%20screen/character%20info/all_info_character.dart';

// import '../../data/models/Character model/character_model.dart';
// import '../../models/character model/character_model.dart';

import '../../pages/more_info/character_info/all_info_character.dart';
import '../../themes/text_styly/app_text_style.dart';

class CharactersGridWidget extends StatelessWidget {
  const CharactersGridWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final RestSingleCharacter model;

  @override
  Widget build(BuildContext context) {
    return InkWellTransparent(
      onTap: () {
        Navigator.of(context).push(
          CupertinoPageRoute(
            builder: (context) => CharacterInfoPage(model: model),
          ),
        );
      },
      child: Column(
        children: [
          CustomAvatar(imageUrl: model.image!, height: 120, width: 120),
          const SizedBox(height: 18),
          Text(
            model.status!.toUpperCase(),
            style: AppTextStyle.w500s10
                .copyWith(color: Converting().getStatusColor(model)),
          ),
          Text(
            model.name!,
            style: AppTextStyle.w500s14,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text('${model.species}, ${model.gender}',
              style: AppTextStyle.w400s12),
        ],
      ),
    );
  }
}
