import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_and_morty/utils/constants/ui_constants.dart';
import 'package:rick_and_morty/utils/resources/app_images.dart';

import '../../themes/colors/app_colors.dart';
import '../../themes/text_styly/app_text_style.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({
    Key? key,
    required this.title,
    this.onTapFilter,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final Function()? onTapFilter;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    // return SizedBox(
    //   height: 48,
    //   child: TextField(
    //     onChanged: onChanged,
    //     onTap: onTap,
    //     style: AppTextStyle.w400s16white,
    //     decoration: InputDecoration(
    //       filled: true,
    //       fillColor: AppColors.color152A3A,
    //       contentPadding:
    //           const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
    //       suffixIcon: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceAround,
    //         children: [
    //           kSBW10,
    //           const VerticalDivider(
    //             width: 1,
    //             color: Colors.white10,
    //             endIndent: 12,
    //             indent: 12,
    //           ),
    //           kSBW10,
    //           InkWell(
    //             // splashColor: AppColors.color0B1E2D,
    //             // highlightColor: AppColors.color0B1E2D,
    //             borderRadius: BorderRadius.circular(100),
    //             radius: 100,

    //             onTap: () {},
    //             child: SvgPicture.asset(
    //               AppImages.filter,
    //               color: AppColors.color5B6975,
    //             ),
    //           ),
    //         ],
    //       ),
    //       prefixIcon: const Icon(
    //         Icons.search_rounded,
    //         color: AppColors.color5B6975,
    //       ),
    //       hintText: title,
    //       hintStyle: AppTextStyle.w400s16,
    //       errorBorder: OutlineInputBorder(
    //         borderSide:
    //             const BorderSide(width: 1.5, color: AppColors.colorEB5757),
    //         borderRadius: BorderRadius.circular(100),
    //       ),
    //       enabledBorder: OutlineInputBorder(
    //         borderSide:
    //             const BorderSide(width: 1.5, color: AppColors.color152A3A),
    //         borderRadius: BorderRadius.circular(100),
    //       ),
    //       focusedBorder: OutlineInputBorder(
    //         borderSide:
    //             const BorderSide(width: 1.5, color: AppColors.color152A3A),
    //         borderRadius: BorderRadius.circular(100),
    //       ),
    //       disabledBorder: OutlineInputBorder(
    //         borderSide:
    //             const BorderSide(width: 1.5, color: AppColors.color152A3A),
    //         borderRadius: BorderRadius.circular(100),
    //       ),
    //       focusedErrorBorder: OutlineInputBorder(
    //         borderSide:
    //             const BorderSide(width: 1.5, color: AppColors.colorEB5757),
    //         borderRadius: BorderRadius.circular(100),
    //       ),
    //     ),
    //   ),
    // );

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: AppColors.color152A3A,
          borderRadius: BorderRadius.circular(100),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        child: Row(children: [
          SvgPicture.asset(
            AppImages.search,
            color: AppColors.color5B6975,
          ),
          kSBW10,
          Text('Найти персонажа', style: AppTextStyle.w400s16),
          const Spacer(),
          kSBW10,
          const VerticalDivider(width: 1, color: Colors.white10),
          kSBW10,
          InkWell(
            // focusColor,
            // splashColor: AppColors.color0B1E2D,
            highlightColor: AppColors.color0B1E2D,
            borderRadius: BorderRadius.circular(100),
            radius: 100,

            onTap: onTapFilter,
            child: SvgPicture.asset(
              AppImages.filter,
              color: AppColors.color5B6975,
            ),
          ),
        ]),
      ),
    );
  }
}
