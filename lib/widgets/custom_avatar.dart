import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/themes/colors/app_colors.dart';
import 'package:rick_and_morty/utils/resources/app_images.dart';

class CustomAvatar extends StatelessWidget {
  const CustomAvatar({
    super.key,
    required this.imageUrl,
    this.width = 40,
    this.height = 40,
    this.radius = 100,
  });
  final double? width;
  final double? height;
  final double? radius;

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius!),
        shape: BoxShape.rectangle,
      ),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        progressIndicatorBuilder: (context, url, progress) => ColoredBox(
          color: AppColors.color152A3A,
          child: Center(
            child: SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: AppColors.color5B6975,
                value: progress.progress,
              ),
            ),
          ),
        ),
        errorWidget: (context, url, error) => Image.asset(AppImages.errorImage),
        fit: BoxFit.cover,
      ),
    );
  }
}
