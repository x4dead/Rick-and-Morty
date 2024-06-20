// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:rick_and_morty/models/models.dart';
// import 'package:rick_and_morty/themes/colors/app_colors.dart';
// import 'package:rick_and_morty/utils/converting.dart';
// import 'package:rick_and_morty/widgets/custom_avatar.dart';
// import 'package:rick_and_morty/widgets/custom_list_tile.dart';
// import '../../pages/more_info/character_info/all_info_character.dart';
// import '../../themes/text_styly/app_text_style.dart';

// class EpisodeListTile extends StatelessWidget {
//   const EpisodeListTile({Key? key, required this.results}) : super(key: key);

//   final RestSingleEpisode results;

//   @override
//   Widget build(BuildContext context) {
//     return IntrinsicHeight(
//       child: CustomListTile(
//         onTap: () {
//           // Navigator.of(context).push(
//           //   MaterialPageRoute(
//           //     builder: (context) => CharacterInf  oPage(model: results),
//           //   ),
//           // );
//         },
//         leadingHeight: 74,
//         leadingWidth: 74,
//         horizontalTitleGap: 18,
//         topOverlineGap: 0,
//         contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
//         title: (Converting().getEpisode(results.episode!)).toUpperCase(),
//         titleStyle: AppTextStyle.w500s10blue,
//         // leadingUrl: results.image!,
//         leading: Hero(
//             tag: 'character-img-${results.url}',
//             child: CustomAvatar(
//               imageUrl: results.url!,
//               height: 74,
//               width: 74,
//               radius: 10,
//             )),
//         subTitle: results.name!,
//         subTitleStyle: AppTextStyle.w500s16,
//         subTitleMaxLines: 1,

//         overline: '${results.airDate}, ${results.gender}',
//         overlineStyle: AppTextStyle.w400s14bN,
//       ),
//     );
//     InkWell(
//       onTap: () {
//         Navigator.of(context).push(
//           CupertinoPageRoute(
//             builder: (context) => CharacterInfoPage(model: results),
//           ),
//         );
//       },
//       child: SizedBox(
//         height: 74,
//         child: Row(
//           children: [
//             SizedBox(
//               child: CircleAvatar(
//                 maxRadius: 37,
//                 minRadius: 37,
//                 child: ClipRRect(
//                     borderRadius: BorderRadius.circular(100),
//                     child: Image.network(
//                       results.image!,
//                       cacheHeight: 200,
//                       cacheWidth: 200,
//                     )),
//               ),
//             ),
//             const SizedBox(width: 18),
//             Padding(
//               padding: const EdgeInsets.only(bottom: 9, top: 9),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(results.status ?? ''),
//                   Text(results.name!, style: AppTextStyle.w500s16),
//                   Text('${results.species}, ${results.gender}',
//                       style: AppTextStyle.w400s12),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
