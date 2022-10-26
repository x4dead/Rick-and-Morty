// import 'package:flutter/cupertino.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// // import 'package:rick_and_morty/data/models/Character%20model/character_model.dart';
// // import 'package:rick_and_morty/data/models/Location%20model/location_model.dart';
// import 'package:rick_and_morty/images.dart';
// import 'package:rick_and_morty/models/character_model.dart';
// import 'package:rick_and_morty/models/repository/character_repo.dart';

// import '../../models/location_model.dart';
// import '../../screens/All character/all_character_screen.dart';
// import '../../screens/Episodes/episode_screen.dart';
// import '../../screens/Location/location_screen.dart';
// import '../../widgets/Character grid/character_grid_widget.dart';
// import '../../widgets/Character list/character_list_widget.dart';

// class CharactersProvider extends ChangeNotifier {
//   List<Widget> screens = [
//     const AllCharacterScreen(),
//     const LocationScreen(),
//     const EpisodeScreen(),
//   ];

//   // final List<CharacterRepo> characters = url;
//   // List<LocationModel> locations = LocationInfoData;

//   bool isActivated = true;

//   SvgPicture icon = SvgPicture.asset(AppImages.grid);

//   ListView listViewCharacter = ListView.separated(
//     physics: const NeverScrollableScrollPhysics(x),
//     shrinkWrap: true,
//     itemCount: AllInfoData.length,
//     addRepaintBoundaries: false,
//     itemBuilder: (context, index) =>
//         CharacterListWidget(model: AllInfoData[index]),
//     separatorBuilder: (context, index) => const SizedBox(height: 24),
//   );

//   GridView gridView = GridView.builder(
//     itemCount: AllInfoData.length,
//     shrinkWrap: true,
//     physics: const NeverScrollableScrollPhysics(),
//     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         mainAxisSpacing: 24,
//         crossAxisSpacing: 16,
//         childAspectRatio: 0.85),
//     itemBuilder: (context, index) => CharactersGridWidget(
//       model: AllInfoData[index],
//     ),
//   );

//   // void changePosition() {
//   //   if (isActivated) {
//   //     isActivated = false;
//   //     icon = SvgPicture.asset(AppImages.list);

//   //     gridView;
//   //   } else {
//   //     isActivated = true;
//   //     icon = SvgPicture.asset(AppImages.grid);

//   //     listViewCharacter;
//   // }
//   // notifyListeners();
//   // }

//   // void searchCharacter(String value) {
//   //   characters = AllInfoData.where((e) {
//   //     return e.name.toLowerCase().contains(value.toLowerCase());
//   //   }).toList();

//   //   notifyListeners();
//   // }

//   // void searchLocation(String value) {
//   //   locations = LocationInfoData.where(
//   //     (e) => (e.worldName.toLowerCase().contains(
//   //           value.toLowerCase(),
//   //         )),
//   //   ).toList();

//   //   notifyListeners();
//   // }

//   // void searchEpisode(String value) {
//   //   locations = LocationInfoData.where(
//   //     (e) => (e.worldName.toLowerCase().contains(
//   //           value.toLowerCase(),
//   //         )),
//   //   ).toList();

//   //   notifyListeners();
//   // }
// }
