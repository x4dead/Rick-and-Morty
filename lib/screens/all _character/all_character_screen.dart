import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../bloc/character_bloc.dart';
import '../../images.dart';

import '../../models/character_model/character_model.dart';
import '../../themes/colors/app_colors.dart';
import '../../themes/text_styly/app_text_style.dart';
import '../../widgets/Search_field/search_field_widget.dart';
import '../../widgets/character_grid/character_grid_widget.dart';
import '../../widgets/character_list/character_list_widget.dart';

class AllCharacterScreen extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const AllCharacterScreen() : super();

  @override
  Widget build(BuildContext context) {
    final blocProvider = BlocProvider.of<CharacterBloc>(context);
    final vm = CharacterModel();
    return Scaffold(
      backgroundColor: AppColors.color0B1E2D,
      body: BlocBuilder<CharacterBloc, CharacterStates>(
        builder: (context, state) {
          if (state is CharacterLoadingState) {
            return Center(
              child: LoadingAnimationWidget.flickr(
                leftDotColor: AppColors.color5B6975,
                rightDotColor: AppColors.colorFFFFFF,
                size: 35,
              ),
            );
          }
          if (state is CharacterSuccesState) {
            return CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            const SizedBox(height: 35),
                            SearchFieldWidget(
                              title: 'Найти персонажа',
                              onChanged: (text) {
                                blocProvider.add(SearchCharacters(
                                  text.toLowerCase(),
                                ));
                              },
                            ),
                            const SizedBox(height: 24),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Всего персонажей:${state.characters}'
                                      .toUpperCase(),
                                  style: AppTextStyle.w500s10
                                      .copyWith(letterSpacing: 1.62),
                                ),
                                InkWell(
                                    onTap: () {
                                      blocProvider
                                          .add(ChangeCharactersPosition());
                                    },
                                    overlayColor: MaterialStateProperty.all(
                                        AppColors.colorTransparent),
                                    child: blocProvider
                                                .characterRepo.isActivated ==
                                            true
                                        ? blocProvider.characterRepo.grid
                                        : blocProvider.characterRepo.list),
                              ],
                            ),
                            const SizedBox(height: 12),
                            blocProvider.allCharacters.isNotEmpty
                                ? blocProvider.characterRepo.isActivated
                                    ? ListView.separated(
                                        shrinkWrap: true,
                                        addRepaintBoundaries: false,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) =>
                                            CharacterListWidget(
                                          results: state.characters[index]
                                              .results![index],
                                        ),
                                        separatorBuilder: (context, index) =>
                                            const SizedBox(
                                          height: 24,
                                        ),
                                        itemCount: state.characters.length,
                                      )
                                    : GridView.builder(
                                        itemCount: state.characters.length,
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                mainAxisSpacing: 24,
                                                crossAxisSpacing: 16,
                                                childAspectRatio: 0.85),
                                        itemBuilder: (context, index) =>
                                            CharactersGridWidget(
                                          model: blocProvider
                                              .allCharacters[index]
                                              .results![index],
                                        ),
                                      )
                                : Column(
                                    children: [
                                      const SizedBox(height: 70),
                                      Image.asset(AppImages.mortyMiddleFinger,
                                          scale: 3.1),
                                      const SizedBox(height: 28),
                                    ],
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
          if (state is CharacterErrorState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    'https://static.wikia.nocookie.net/rickandmorty/images/4/41/Pickle_rick_transparent_edgetrimmed.png/revision/latest/scale-to-width-down/350?cb=20220105043415',
                    scale: 1.8,
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Произошла ошибка, повторите запрос!',
                    style: AppTextStyle.w500s18,
                  ),
                ],
              ),
            );
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  'https://static.wikia.nocookie.net/rickandmorty/images/4/41/Pickle_rick_transparent_edgetrimmed.png/revision/latest/scale-to-width-down/350?cb=20220105043415',
                  scale: 1.8,
                ),
                const SizedBox(height: 15),
                const Text(
                  'Список пуст!',
                  style: AppTextStyle.w500s18,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
