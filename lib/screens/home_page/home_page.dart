﻿// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../images.dart';
import '../../models/repository/repository.dart';
import '../../themes/colors/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CharacterRepo>();

    vm.screens.length;
    return Scaffold(
      body: vm.screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          print(index);
          currentIndex = index;
        },
        currentIndex: currentIndex,
        backgroundColor: AppColors.color152A3A,
        unselectedItemColor: AppColors.color5B6975,
        selectedItemColor: AppColors.color43D049,
        unselectedLabelStyle:
            const TextStyle(color: AppColors.color5B6975, fontSize: 12),
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          color: AppColors.color43D049,
        ),
        type: BottomNavigationBarType.fixed,
        elevation: 10,
        items: [
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              AppImages.subtract,
              color: AppColors.color43D049,
            ),
            icon: SvgPicture.asset(AppImages.subtract,
                color: AppColors.color5B6975),
            label: 'Персонажи',
          ),
          BottomNavigationBarItem(
            activeIcon: (SvgPicture.asset(
              AppImages.location,
              color: AppColors.color43D049,
            )),
            icon: SvgPicture.asset(AppImages.location),
            label: 'Локации',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              AppImages.episode,
              color: AppColors.color43D049,
            ),
            icon: SvgPicture.asset(AppImages.episode),
            label: 'Эпизоды',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              AppImages.settings,
              color: AppColors.color43D049,
            ),
            icon: SvgPicture.asset(AppImages.settings),
            label: 'Настройки',
          ),
        ],
      ),
    );
  }
}
