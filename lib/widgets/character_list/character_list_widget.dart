import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/character_model/character_model.dart';
import '../../screens/more_info_screen/character info/all_info_character.dart';
import '../../themes/text_styly/app_text_style.dart';

class CharacterListWidget extends StatelessWidget {
  const CharacterListWidget({Key? key, required this.results})
      : super(key: key);

  final Results results;

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
