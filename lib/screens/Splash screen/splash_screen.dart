import 'package:flutter/material.dart';
import 'package:rick_and_morty/images.dart';
import 'package:rick_and_morty/themes/colors/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Duration myDuration = const Duration(milliseconds: 800);
  double myOpacity = 0.0;
  void initialize() async {
    await Future.delayed(
      const Duration(milliseconds: 1000),
    );
    setState(() {
      myOpacity = 1;
    });

    await Future.delayed(
      const Duration(milliseconds: 700),
    );
    // ignore: use_build_context_synchronously
    await Navigator.pushNamedAndRemoveUntil(
        context, '/HomePage', (route) => false);
  }

  @override
  void initState() {
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color0B1E2D,
      body: Center(
          child: Stack(children: [
        Image.asset(AppImages.splash),
        Positioned(
          left: 52.36,
          top: 53.92,
          child: AnimatedOpacity(
            opacity: myOpacity,
            duration: myDuration,
            child: Image.asset(
              AppImages.title,
              scale: 4.2,
              colorBlendMode: BlendMode.modulate,
            ),
          ),
        ),
        Positioned(
          top: 411.57,
          left: 32.39,
          child: AnimatedOpacity(
            opacity: myOpacity,
            duration: myDuration,
            child: Image.asset(
              AppImages.mortySplash,
              scale: 4.1,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 46.76,
          child: AnimatedOpacity(
            opacity: myOpacity,
            duration: myDuration,
            child: Image.asset(
              AppImages.rickSplash,
              scale: 4.1,
            ),
          ),
        ),
      ])),
    );
  }
}
