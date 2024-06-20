import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:rick_and_morty/models/models.dart';
import 'package:rick_and_morty/modules/signal_service/river/river.dart';
import 'package:rick_and_morty/themes/themes.dart';

import 'package:rick_and_morty/utils/constants/ui_constants.dart';
import 'package:rick_and_morty/utils/resources/app_images.dart';
import 'package:rick_and_morty/widgets/character_widgets/character_grid_widget.dart';
import 'package:rick_and_morty/widgets/character_widgets/character_list_tile.dart';
import 'package:rick_and_morty/widgets/custom_search_delegate.dart';
// import 'package:rick_and_morty/widgets/custom_search_delegate.dart';
import 'package:rick_and_morty/widgets/search_field/search_field_widget.dart';

final getCharacters =
    FutureProvider.family<AllCharacters, int>((ref, page) async {
  return ref.read(River.charactersPod.notifier).getAllCharacters(pages: page);
});
final isListCharacters = StateProvider<bool>((ref) => true);

class AllCharacterScreen extends ConsumerWidget {
  const AllCharacterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.color0B1E2D,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 10.29, 16, 24),
                  child: Column(
                    children: [
                      kSBH48,
                      kSBH20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Всего персонажей: ${ref.watch(River.charactersPod).characters?.characters?.length ?? 0}'
                                .toUpperCase(),
                            style: AppTextStyle.w500s10
                                .copyWith(letterSpacing: 1.62),
                          ),
                          InkWell(
                              onTap: () {
                                if (ref.watch(isListCharacters) == true) {
                                  ref.read(isListCharacters.notifier).state =
                                      false;
                                } else {
                                  ref.read(isListCharacters.notifier).state =
                                      true;
                                }
                              },
                              overlayColor: WidgetStateProperty.all(
                                  AppColors.colorTransparent),
                              child: SvgPicture.asset(
                                  ref.watch(isListCharacters) == true
                                      ? AppImages.grid
                                      : AppImages.list)),
                        ],
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: ref.watch(getCharacters(0)).when(
                        skipLoadingOnRefresh: false,
                        skipLoadingOnReload: false,
                        error: (e, stackTrace) => Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                overlayColor: const WidgetStatePropertyAll(
                                    AppColors.colorTransparent),
                                onTap: () {
                                  ref
                                      .read(River.charactersPod.notifier)
                                      .clearCharactersList();
                                  ref.invalidate(getCharacters);
                                },
                                child: Image.asset(
                                  AppImages.mortyNoEyes,
                                  width: 134,
                                  height: 224.75,
                                ),
                              ),
                              kSBH24,
                              Text(
                                (e as DioException).message ??
                                    'Ошибка получения персонажей',
                                textAlign: TextAlign.center,
                                style: AppTextStyle.w400s16,
                              ),
                            ],
                          ),
                        ),
                        loading: () => Center(
                          child: LoadingAnimationWidget.flickr(
                            leftDotColor: AppColors.color5B6975,
                            rightDotColor: AppColors.colorFFFFFF,
                            size: 35,
                          ),
                        ),
                        data: (data) {
                          if (ref
                                  .watch(River.charactersPod)
                                  .characters
                                  ?.characters
                                  ?.isEmpty ??
                              true) {
                            return Center(
                              child: Image.asset(AppImages.mortyMiddleFinger,
                                  scale: 3.1),
                            );
                          } else {
                            return CustomScrollView(
                              slivers: [
                                if (ref.watch(isListCharacters) == true)
                                  SliverList.separated(
                                    itemCount: ref
                                        .watch(River.charactersPod)
                                        .characters
                                        ?.characters
                                        ?.length,
                                    itemBuilder: (context, index) =>
                                        CharacterListTile(
                                      results: ref
                                          .watch(River.charactersPod)
                                          .characters!
                                          .characters![index],
                                    ),
                                    separatorBuilder: (context, index) =>
                                        kSBH12,
                                  )
                                else
                                  SliverPadding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    sliver: SliverGrid.builder(
                                      itemCount: data.characters!.length,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              mainAxisSpacing: 24,
                                              crossAxisSpacing: 16,
                                              childAspectRatio: 0.9),
                                      itemBuilder: (context, index) =>
                                          CharactersGridWidget(
                                        model: data.characters![index],
                                      ),
                                    ),
                                  )
                              ],
                            );
                          }
                        },
                      ),
                ),
                // // blocProvider.allCharacters.isNotEmpty
                //     ? blocProvider.characterRepo.isActivated
                //         ? ListView.separated(
                //             shrinkWrap: true,
                //             addRepaintBoundaries: false,
                //             physics:
                //                 const NeverScrollableScrollPhysics(),
                //             itemBuilder: (context, index) =>
                //                 CharacterListWidget(
                //               results: state.characters[index]
                //                   .results![index],
                //             ),
                //             separatorBuilder: (context, index) =>
                //                 const SizedBox(
                //               height: 24,
                //             ),
                //             itemCount: state.characters.length,
                //           )
                //         : GridView.builder(
                //             itemCount: state.characters.length,
                //             shrinkWrap: true,
                //             physics:
                //                 const NeverScrollableScrollPhysics(),
                //             gridDelegate:
                //                 const SliverGridDelegateWithFixedCrossAxisCount(
                //                     crossAxisCount: 2,
                //                     mainAxisSpacing: 24,
                //                     crossAxisSpacing: 16,
                //                     childAspectRatio: 0.85),
                //             itemBuilder: (context, index) =>
                //                 CharactersGridWidget(
                //               model: blocProvider
                //                   .allCharacters[index]
                //                   .results![index],
                //             ),
                //           )
                // : Column(
                //     children: [
                //       const SizedBox(height: 70),
                //       Image.asset(AppImages.mortyMiddleFinger,
                //           scale: 3.1),
                //       const SizedBox(height: 28),
                //     ],
                //   ),
                // ],
                // ),
                // ),
              ],
            ),
            SearchFieldWidget(
              title: 'Найти персонажа',
              onTap: () {
                showSearchBar(
                    context: context, delegate: CustomSearchDelegate(ref: ref));
              },
            ),
          ],
        ),
      ),
    );
  }
  // if (state is CharacterErrorState) {
  // return
  // Center(
  //   child: Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       Image.network(
  //         'https://static.wikia.nocookie.net/rickandmorty/images/4/41/Pickle_rick_transparent_edgetrimmed.png/revision/latest/scale-to-width-down/350?cb=20220105043415',
  //         scale: 1.8,
  //       ),
  //       const SizedBox(height: 15),
  //       const Text(
  //         'Произошла ошибка, повторите запрос!',
  //         style: AppTextStyle.w500s18,
  //       ),
  //     ],
  //   ),
  // );
  // }
  // return Center(
  //   child: Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       Image.network(
  //         'https://static.wikia.nocookie.net/rickandmorty/images/4/41/Pickle_rick_transparent_edgetrimmed.png/revision/latest/scale-to-width-down/350?cb=20220105043415',
  //         scale: 1.8,
  //       ),
  //       const SizedBox(height: 15),
  //       const Text(
  //         'Список пуст!',
  //         style: AppTextStyle.w500s18,
  //       ),
  //     ],
  //   ),
  // );
  // },
  //   ),
  // );
}

// }

