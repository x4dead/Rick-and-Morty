import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/models/models.dart';
import 'package:rick_and_morty/themes/colors/app_colors.dart';
import '../../../models/repository/repository.dart';
import '../../../themes/text_styly/app_text_style.dart';

import '../character info/Shapka-Ava/shapka_ava.dart';

class AllInfoLocation extends StatelessWidget {
  const AllInfoLocation({Key? key, required this.model}) : super(key: key);

  final RestSingleLocation model;

  @override
  Widget build(BuildContext context) {
    // final vm = context.watch<CharacterRepo>();
    return Scaffold(
      backgroundColor: AppColors.color0B1E2D,
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Stack(
                  children: [
                    const SizedBox(
                      width: double.infinity,
                      height: 300,
                    ),
                    BGImageWidget(worldImage: model.dimension!),
                    Positioned(
                      left: 24,
                      top: 48,
                      child: ArrowBack(),
                    ),
                    // MainLayot(
                    //   worldName: model.worldName,
                    //   model: model,
                    // ),
                    //  vm.listViewCharacter,
                  ],
                ),
                Column(
                  children: [
                    // const SizedBox(height: 320),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.color0B1E2D,
                        borderRadius: BorderRadius.circular(26),
                      ),
                      height: MediaQuery.of(context).size.height * 0.576,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 36),
                          Text('model.worldName', style: AppTextStyle.w700s24),
                          const SizedBox(height: 3),
                          RealityName(model: model),
                          const SizedBox(height: 32),
                          Text(
                            'Это планета, на которой проживает человеческая раса, и главное место для персонажей Рика и Морти. Возраст этой Земли более 4,6 миллиардов лет, и она является четвертой планетой от своей звезды.',
                            style: AppTextStyle.w400s14
                                .copyWith(letterSpacing: 0.25),
                          ),
                          const SizedBox(height: 36),
                          // vm.listViewCharacter
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BGImageWidget extends StatelessWidget {
  const BGImageWidget({
    Key? key,
    required this.worldImage,
  }) : super(key: key);

  final String worldImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.47,
      child: Image.asset(
        worldImage,
        fit: BoxFit.cover,
      ),
    );
  }
}

class MainLayot extends StatelessWidget {
  const MainLayot({Key? key, required this.model, required this.worldName})
      : super(key: key);

  final RestSingleLocation model;
  final String worldName;

  @override
  Widget build(BuildContext context) {
    // final vm = context.watch<CharactersProvider>();
    return Column(
      children: [
        const SizedBox(height: 320),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.color0B1E2D,
            borderRadius: BorderRadius.circular(26),
          ),
          height: MediaQuery.of(context).size.height * 0.576,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 36),
              Text(worldName, style: AppTextStyle.w700s24),
              const SizedBox(height: 3),
              RealityName(model: model),
              const SizedBox(height: 32),
              Text(
                'Это планета, на которой проживает человеческая раса, и главное место для персонажей Рика и Морти. Возраст этой Земли более 4,6 миллиардов лет, и она является четвертой планетой от своей звезды.',
                style: AppTextStyle.w400s14.copyWith(letterSpacing: 0.25),
              ),
              const SizedBox(height: 36),
            ],
          ),
        ),
      ],
    );
  }
}

class RealityName extends StatelessWidget {
  const RealityName({
    Key? key,
    required this.model,
  }) : super(key: key);

  final RestSingleLocation model;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Мир • Измерение {model.reality}', style: AppTextStyle.w400s12)
      ],
    );
  }
}
