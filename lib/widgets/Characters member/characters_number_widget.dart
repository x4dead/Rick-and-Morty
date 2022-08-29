// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:rick_and_morty/data/provider/characters_provider.dart';
// import '../../themes/text_styly/app_text_style.dart';

// class CharactersNumber extends StatelessWidget {
//   const CharactersNumber({
//     Key? key,
//     required this.title,
//   }) : super(key: key);
//   final String title;

//   @override
//   Widget build(BuildContext context) {
//     // String ?isOn= 'Всего локаций';
//     final vm = context.watch<CharactersProvider>();
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           title.toUpperCase(),
//           style: AppTextStyly.w500s10.copyWith(letterSpacing: 1.5),
//         ),
//         InkWell(
//           onTap: () {
//             vm.changePosition();
//           },
//           child: vm.icon,
//         ),
//       ],
//     );
//   }
// }
