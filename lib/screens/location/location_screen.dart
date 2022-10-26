import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/bloc/character_bloc.dart';
import '../../themes/colors/app_colors.dart';
import '../../themes/text_styly/app_text_style.dart';
import '../../widgets/Search_field/search_field_widget.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final blocProvider = BlocProvider.of<CharacterBloc>(context);
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
                      SearchFieldWidget(
                        title: 'Найти локацию',
                        onChanged: (v) {
                          // vr.searchLocation(v);
                        },
                      ),
                      const SizedBox(height: 24),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          // 'sda    ',
                          'Всего локаций:${blocProvider.allCharacters.length}'
                              .toUpperCase(),
                          style:
                              AppTextStyle.w500s10.copyWith(letterSpacing: 1.5),
                        ),
                      ),
                      // ListView.separated(
                      //   physics: const NeverScrollableScrollPhysics(),
                      //   shrinkWrap: true,
                      //   itemCount: vm..length,
                      //   itemBuilder: (context, index) =>
                      //       LocationsCard(model: vm.locations[index]),
                      //   separatorBuilder: (context, index) =>
                      //       const SizedBox(height: 26),
                      // ),
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
