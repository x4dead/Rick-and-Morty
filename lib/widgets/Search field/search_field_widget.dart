import 'package:flutter/material.dart';

import '../../themes/colors/app_colors.dart';
import '../../themes/text_styly/app_text_style.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: AppTextStyle.w400s16white,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.color152A3A,
        contentPadding: const EdgeInsets.all(16),
        suffixIcon: IconButton(
          splashColor: AppColors.color0B1E2D,
          highlightColor: AppColors.color0B1E2D,
          onPressed: () {},
          icon: const Icon(
            Icons.filter_alt,
            color: AppColors.color5B6975,
          ),
        ),
        prefixIcon: const Icon(
          Icons.search,
          color: AppColors.color5B6975,
        ),
        hintText: title,
        hintStyle: AppTextStyle.w400s16,
        errorBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(width: 1.5, color: AppColors.colorEB5757),
          borderRadius: BorderRadius.circular(100),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(width: 1.5, color: AppColors.color152A3A),
          borderRadius: BorderRadius.circular(100),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: 1.5, color: AppColors.color5B6975.withOpacity(0.4)),
          borderRadius: BorderRadius.circular(100),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(width: 1.5, color: AppColors.color152A3A),
          borderRadius: BorderRadius.circular(100),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(width: 1.5, color: AppColors.colorEB5757),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}
