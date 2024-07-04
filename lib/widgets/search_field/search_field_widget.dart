import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import 'package:rick_and_morty/utils/constants/ui_constants.dart';
import 'package:rick_and_morty/utils/extentions/media_query.dart';
import 'package:rick_and_morty/utils/resources/app_images.dart';

import '../../themes/colors/app_colors.dart';
import '../../themes/text_styly/app_text_style.dart';

class SearchFieldWidget extends StatefulWidget {
  const SearchFieldWidget({
    Key? key,
    required this.title,
    this.onTapFilter,
    // required this.onTap,
  }) : super(key: key);
  final String title;
  final Function()? onTapFilter;
  // final Function()? onTap;

  @override
  State<SearchFieldWidget> createState() => _SearchFieldWidgetState();
}

class _SearchFieldWidgetState extends State<SearchFieldWidget> {
  final controller = FloatingSearchBarController();
  @override
  Widget build(BuildContext context) {
    return FloatingSearchBar(
      controller: controller,
      hint: widget.title,
      backgroundColor: AppColors.color152A3A,
      accentColor: Colors.transparent,
      backdropColor: AppColors.color0B1E2D,
      clearQueryOnClose: true,
      shadowColor: AppColors.color0B1E2D,
      elevation: 2,
      width: context.width,

      // automaticallyImplyBackButton: false,

      transition: ExpandingFloatingSearchBarTransition(
          innerElevation: 8, divider: kNothing),

      hintStyle: AppTextStyle.w400s16,
      // insets: EdgeInsets.all(8),
      // openWidth: 400,
      // initiallyHidden: true,
      onFocusChanged: (isFocused) {
        if (!isFocused) {
          // controller.close();
          setState(() {});
        }
      },

      // onKeyEvent: (value) {
      //   if (value.deviceType== Key) {}
      // },
      borderRadius:
          BorderRadius.all(Radius.circular(controller.isOpen ? 0 : 100)),
      // scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      // transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      implicitDuration: Durations.medium2,
      transitionDuration: Durations.medium2,
      physics: const BouncingScrollPhysics(),

      // axisAlignment: isPortrait ? 0.0 : -1.0,
      // openAxisAlignment: 0.0,
      // width: 500,
      height: 48,
      leadingActions: [
        FloatingSearchBarAction(
          child: SvgPicture.asset(
            AppImages.search,
            color: AppColors.color5B6975,
          ),
        ),
        FloatingSearchBarAction(
          showIfClosed: false,
          showIfOpened: true,
          child: GestureDetector(
            onTap: () {
              controller.close();
            },
            child: const SizedBox(
              height: 36,
              width: 36,
              child: Icon(
                CupertinoIcons.arrow_left,
                color: AppColors.colorFFFFFF,
              ),
            ),
          ),
        ),
        const FloatingSearchBarAction(child: kSBW10),
        const FloatingSearchBarAction(
            showIfOpened: true, showIfClosed: false, child: kSBW14),
      ],
      actions: [
        FloatingSearchBarAction(
          showIfClosed: false,
          showIfOpened: true,
          child: GestureDetector(
            onTap: () {
              controller.clear();
            },
            child: const SizedBox(
              height: 36,
              width: 36,
              child: Icon(
                Icons.close_rounded,
                color: AppColors.colorFFFFFF,
              ),
            ),
          ),
        ),
        FloatingSearchBarAction(
          child: InkWell(
            // focusColor,
            // splashColor: AppColors.color0B1E2D,
            highlightColor: AppColors.color0B1E2D,

            borderRadius: BorderRadius.circular(100),
            radius: 100,

            onTap: widget.onTapFilter,
            child: SvgPicture.asset(
              AppImages.filter,
              color: AppColors.color5B6975,
            ),
          ),
          // builder: (context, animation) {
          //   return ScaleTransition(
          //       scale: animation,
          //       child: InkWell(
          //         // focusColor,
          //         // splashColor: AppColors.color0B1E2D,
          //         highlightColor: AppColors.color0B1E2D,

          //         borderRadius: BorderRadius.circular(100),
          //         radius: 100,

          //         onTap: onTapFilter,
          //         child: SvgPicture.asset(
          //           AppImages.filter,
          //           color: AppColors.color5B6975,
          //         ),
          //       ));
          // },
        ),
      ],

      // body: Container(
      //   height: 48,
      //   decoration: BoxDecoration(
      //     color: AppColors.color152A3A,
      //     borderRadius: BorderRadius.circular(100),
      //   ),
      //   padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      //   child: Row(children: [
      //     SvgPicture.asset(
      //       AppImages.search,
      //       color: AppColors.color5B6975,
      //     ),
      //     kSBW10,
      //     Text('Найти персонажа', style: AppTextStyle.w400s16),
      //     const Spacer(),
      //     kSBW10,
      //     if (onTapFilter != null) ...[
      //       const VerticalDivider(width: 1, color: Colors.white10),
      //       kSBW10,
      //       InkWell(
      //         // focusColor,
      //         // splashColor: AppColors.color0B1E2D,
      //         highlightColor: AppColors.color0B1E2D,
      //         borderRadius: BorderRadius.circular(100),
      //         radius: 100,

      //         onTap: onTapFilter,
      //         child: SvgPicture.asset(
      //           AppImages.filter,
      //           color: AppColors.color5B6975,
      //         ),
      //       ),
      //     ]
      //   ]),
      // ),

      debounceDelay: const Duration(milliseconds: 500),
      // actions: [
      //   FloatingSearchBarAction(
      //     showIfOpened: false,
      //     child: CircularButton(
      //       icon: const Icon(Icons.place),
      //       onPressed: () {},
      //     ),
      //   ),
      //   FloatingSearchBarAction.searchToClear(
      //     showIfClosed: false,
      //   ),
      // ],

      builder: (context, transition) {
        return Column(
          children: [
            // Container(
            //   height: 48,
            //   decoration: BoxDecoration(
            //     color: AppColors.color152A3A,
            //     borderRadius: BorderRadius.circular(100),
            //   ),
            //   padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            //   child: Row(children: [
            //     SvgPicture.asset(
            //       AppImages.search,
            //       color: AppColors.color5B6975,
            //     ),
            //     kSBW10,
            //     Text('Найти персонажа', style: AppTextStyle.w400s16),
            //     const Spacer(),
            //     kSBW10,
            //     if (onTapFilter != null) ...[
            //       const VerticalDivider(width: 1, color: Colors.white10),
            //       kSBW10,
            //       InkWell(
            //         // focusColor,
            //         // splashColor: AppColors.color0B1E2D,
            //         highlightColor: AppColors.color0B1E2D,
            //         borderRadius: BorderRadius.circular(100),
            //         radius: 100,

            //         onTap: onTapFilter,
            //         child: SvgPicture.asset(
            //           AppImages.filter,
            //           color: AppColors.color5B6975,
            //         ),
            //       ),
            //     ]
            //   ]),
            // ),
          ],
        );
      },
    );
  }
}
