import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/repository/repository.dart';
import '../../themes/colors/app_colors.dart';
import '../../widgets/Search_field/search_field_widget.dart';

class EpisodeScreen extends StatelessWidget {
  const EpisodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final vr = context.read<CharacterRepo>();
    // final vm = context.watch<CharacterRepo>();
    return Scaffold(
      backgroundColor: AppColors.color0B1E2D,
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const SizedBox(height: 35),
                      SearchFieldWidget(
                        title: 'Найти эпизод',
                        // onTap: () {
                        // vr.searchLocation(v);
                        // },
                      ),
                      const SizedBox(height: 8),
                      // ListView.builder(
                      //   shrinkWrap: true,
                      //   physics: ScrollPhysics(),
                      //   scrollDirection: Axis.horizontal,
                      //   itemBuilder: (context, index) =>
                      //       //  InkWell(
                      //       // child:
                      //       Text(
                      //     'Сезон 1'.toUpperCase(),
                      //     style: AppTextStyle.w400s16white,
                      //     // ),
                      //   ),
                      //   itemCount: 2,
                      // ),
                      const SizedBox(height: 24),
                      // ListView.separated(
                      //   shrinkWrap: true,
                      //   itemBuilder: (context, index) =>
                      //       CharacterListWidget(model: vm.characters[index]),
                      //   separatorBuilder: (context, index) =>
                      //       const SizedBox(height: 24),
                      //   itemCount: 4,
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
