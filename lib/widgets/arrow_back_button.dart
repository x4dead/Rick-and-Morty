import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_and_morty/utils/constants/resources/app_images.dart';

class ArrowBackButton extends StatelessWidget {
  const ArrowBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () {
        Navigator.pop(context);
      },
      child: SvgPicture.asset(AppImages.arrowBack),
    );
  }
}
