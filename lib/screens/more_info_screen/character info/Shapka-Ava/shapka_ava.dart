import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../images.dart';
import '../../../../themes/colors/app_colors.dart';
// import '../../images
// // import '../../themes/colors/app_colors.dart';

class ShapkaAva extends StatelessWidget {
  const ShapkaAva({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SizedBox(height: 300),
        Image.asset(
          AppImages.shapka,
          cacheHeight: 233,
          cacheWidth: 400,
        ),
        const Positioned(
          left: 24,
          top: 58,
          child: ArrowBack(),
        ),
        Positioned(
          top: 138,
          left: 115,
          child: CircleAvatar(
            maxRadius: 88,
            minRadius: 88,
            backgroundColor: AppColors.color0B1E2D,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                image,
                cacheHeight: 300,
                cacheWidth: 300,
                scale: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ArrowBack extends StatelessWidget {
  const ArrowBack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: SvgPicture.asset(AppImages.arrowBack),
    );
  }
}
