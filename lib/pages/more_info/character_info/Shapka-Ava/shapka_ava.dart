import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/themes/colors/app_colors.dart';
import 'package:rick_and_morty/utils/extentions/media_query.dart';
import 'package:rick_and_morty/utils/resources/app_images.dart';
import 'package:rick_and_morty/widgets/arrow_back_button.dart';
import 'package:rick_and_morty/widgets/custom_avatar.dart';

// import '../../images
// // import '../../themes/colors/app_colors.dart';

// class ShapkaAva extends StatelessWidget {
//   const ShapkaAva({
//     Key? key,
//     required this.image,
//   }) : super(key: key);

//   final String image;

//   @override
//   Widget build(BuildContext context) {
//     return SliverAppBar(
//       surfaceTintColor: AppColors.color0B1E2D,
//       toolbarHeight: 188,
//       snap: true,
//       leadingWidth: 64,
//       clipBehavior: Clip.hardEdge,
//       floating: true,
//       leading: const Row(
//         children: [
//           kSBW16,
//           ArrowBack(),
//         ],
//       ),
//       stretch: true,
//       backgroundColor: AppColors.color0B1E2D,
//       flexibleSpace: SizedBox(
//         height: 218,
//         child: ImageFiltered(
//             imageFilter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
//             child: CustomAvatar(imageUrl: image, radius: 0)),
//       ),
//       bottom: PreferredSize(
//         preferredSize: const Size(double.infinity, 66),
//         child: SizedBox(
//           height: 162,
//           width: 162,
//           child: CircleAvatar(
//               backgroundColor: AppColors.color0B1E2D,
//               child: CustomAvatar(
//                 imageUrl: image,
//                 height: 146,
//                 width: 146,
//               )),
//         ),
//       ),
//       systemOverlayStyle: SystemUiOverlayStyle.dark,
//     );
//   }
// }

class ChatInfoHeader extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final String image;

  ChatInfoHeader(this.image, {required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final titlePosition = expandedHeight / 3 - shrinkOffset + 70;
    final buttonPosition = expandedHeight / 3 - shrinkOffset - 18;
    final titleBorder = expandedHeight / 2 - shrinkOffset + 53;
    final titleSize = expandedHeight / 2 - shrinkOffset + 37;
    return SizedBox(
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          ImageFiltered(
            imageFilter: ImageFilter.blur(
                tileMode: TileMode.repeated, sigmaX: 4, sigmaY: 4),
            child: Container(
              clipBehavior: Clip.hardEdge,
              width: double.infinity,
              height: 218,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: Image.network(
                  image,
                  errorBuilder: (context, error, stackTrace) =>
                      Image.asset(AppImages.errorImage),
                ).image,
                fit: BoxFit.cover,
              )),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: AppColors.characterBackGradient,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.color0B1E2D.withOpacity(0.65),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              top: buttonPosition <= 33 ? 33 : buttonPosition,
              left: 16,
              child: const ArrowBackButton()),
          Positioned(
            top: titlePosition <= 33 ? 33 : titlePosition,
            child: SizedBox(
              width: context.width,
              child: SizedBox(
                height: titleBorder <= 60 ? 60 : titleBorder,
                child: Hero(
                  tag: 'character-img-$image',
                  child: CircleAvatar(
                      backgroundColor: AppColors.color0B1E2D,
                      child: CustomAvatar(
                        imageUrl: image,
                        height: titleSize <= 60 ? 60 : titleSize,
                        width: titleSize <= 60 ? 60 : titleSize,
                      )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 88;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
