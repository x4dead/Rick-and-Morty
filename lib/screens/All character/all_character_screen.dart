import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/data/provider/characters_provider.dart';
import 'package:rick_and_morty/themes/colors/app_colors.dart';
import '../../themes/text_styly/app_text_style.dart';
import '../../widgets/Search field/search_field_widget.dart';

class AllCharacterScreen extends StatelessWidget {
  const AllCharacterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CharactersProvider>();
    return Scaffold(
      backgroundColor: AppColors.color0B1E2D,
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 35),
                      const SearchFieldWidget(title: 'Найти персонажа'),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Всего персонажей:${vm.characters.length}'
                                .toUpperCase(),
                            style: AppTextStyle.w500s10
                                .copyWith(letterSpacing: 1.5),
                          ),
                          InkWell(
                            onTap: () {
                              vm.changePosition();
                            },
                            child: vm.icon,
                          ),
                        ],
                      ),
                      vm.isActivated ? vm.listViewCharacter : vm.gridView,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
