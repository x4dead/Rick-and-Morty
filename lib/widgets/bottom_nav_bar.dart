import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/pages/scaffold_navigation_page.dart';
import 'package:rick_and_morty/themes/colors/app_colors.dart';
import 'package:rick_and_morty/utils/constants/resources/app_images.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SalomonBottomBar(
      currentIndex: ref.watch(navigationsButtonPod),
      onTap: (index) {
        if (ref.watch(navigationsButtonPod) != index) {
          ref.read(navigationsButtonPod.notifier).state = index;
          navigationShell.goBranch(index);
        }
      },
      backgroundColor: AppColors.color152A3A,
      items: [
        /// Персонажи
        SalomonBottomBarItem(
          activeIcon: SvgPicture.asset(
            AppImages.subtract,
            color: AppColors.color43D049,
          ),
          icon: SvgPicture.asset(
            AppImages.subtract,
            color: AppColors.color5B6975,
          ),
          title: const Text("Персонажи"),
          selectedColor: AppColors.color43D049,
        ),

        /// Локации
        SalomonBottomBarItem(
          activeIcon: SvgPicture.asset(
            AppImages.location,
            color: AppColors.color43D049,
          ),
          icon: SvgPicture.asset(
            AppImages.location,
            color: AppColors.color5B6975,
          ),
          title: const Text("Локации"),
          selectedColor: AppColors.color43D049,
        ),

        /// Эпизоды
        SalomonBottomBarItem(
          activeIcon: SvgPicture.asset(
            AppImages.episode,
            color: AppColors.color43D049,
          ),
          icon: SvgPicture.asset(
            AppImages.episode,
            color: AppColors.color5B6975,
          ),
          title: const Text("Эпизоды"),
          selectedColor: AppColors.color43D049,
        ),

        /// Настройки
        SalomonBottomBarItem(
          activeIcon: SvgPicture.asset(
            AppImages.settings,
            color: AppColors.color43D049,
          ),
          icon: SvgPicture.asset(
            AppImages.settings,
            color: AppColors.color5B6975,
          ),
          title: const Text("Настройки"),
          selectedColor: AppColors.color43D049,
        ),
      ],
    );
  }
}
