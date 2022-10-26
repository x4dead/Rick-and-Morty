// import 'package:flutter/material.dart';
// import 'package:rick_and_morty/models/location_model.dart';
// // import 'package:rick_and_morty/data/models/Location%20model/location_model.dart';
// // import 'package:rick_and_morty/data/models/Location%20model/location_model.dart';
// import 'package:rick_and_morty/themes/colors/app_colors.dart';
// // import '../../data/models/Location model/location_model.dart';s
// import '../../screens/More info screen/location info/all_info_location.dart';
// import '../../themes/text_styly/app_text_style.dart';

// class LocationsCard extends StatelessWidget {
//   const LocationsCard({
//     Key? key,
//     required this.model,
//   }) : super(key: key);

//   final LocationModel model;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Navigator.of(context).push(MaterialPageRoute(
//           builder: (context) => AllInfoLocation(
//             model: model,
//           ),
//         ));
//       },
//       child: Column(
//         children: [
//           ClipRRect(
//               borderRadius: const BorderRadius.only(
//                   topLeft: Radius.circular(20), topRight: Radius.circular(20)),
//               child: Image.asset(
//                 'model.wordImage',
//                 scale: 0.1,
//               )),
//           Container(
//             decoration: const BoxDecoration(
//               color: AppColors.color152A3A,
//               borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(20),
//                   bottomRight: Radius.circular(20)),
//             ),
//             padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('model.worldName', style: AppTextStyle.w500s20),
//                 const SizedBox(height: 5),
//                 RealityName(model: model),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
