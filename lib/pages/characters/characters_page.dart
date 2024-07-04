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
import 'package:rick_and_morty/widgets/fade_animation_widget.dart';
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
    buildBody() {
      return SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 10.29, 16, 24),
              child: Column(
                children: [
                  kSBH48,
                  kSBH20,
                  FadeAnimation(
                    (1.0 + 1) / 4,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Всего персонажей: ${ref.watch(River.charactersPod).characters?.characters?.length ?? 0}'
                              .toUpperCase(),
                          style: AppTextStyle.w500s10
                              .copyWith(letterSpacing: 1.62),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (ref.watch(isListCharacters) == true) {
                              ref.read(isListCharacters.notifier).state = false;
                            } else {
                              ref.read(isListCharacters.notifier).state = true;
                            }
                          },
                          child: AnimatedSwitcher(
                            reverseDuration: Durations.short4,
                            duration: Durations.medium1,
                            switchOutCurve: Curves.easeIn,
                            transitionBuilder: (child, animation) =>
                                ScaleTransition(scale: animation, child: child),
                            child: Center(
                              key: ValueKey<String>(
                                  ref.watch(isListCharacters) == true
                                      ? AppImages.grid
                                      : AppImages.list),
                              child: SvgPicture.asset(
                                  ref.watch(isListCharacters) == true
                                      ? AppImages.grid
                                      : AppImages.list),
                            ),
                          ),
                        ),
                      ],
                    ),
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
                        return FadeAnimation(
                          (1.0 + 2) / 4,
                          CustomScrollView(
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
                                  separatorBuilder: (context, index) => kSBH12,
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
                          ),
                        );
                      }
                    },
                  ),
            ),
          ],
        ),
      );
    }

    showSearch() {
      return const SearchFieldWidget(
        title: 'Найти персонажа',
      );
    }

    return Scaffold(
      backgroundColor: AppColors.color0B1E2D,
      body: Stack(
        fit: StackFit.expand,
        children: [
          buildBody(),
          showSearch(),
        ],
      ),
    );
  }
}
