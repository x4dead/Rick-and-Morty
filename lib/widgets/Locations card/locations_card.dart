import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/models/Location%20model/location_model.dart';
import 'package:rick_and_morty/themes/colors/app_colors.dart';
import '../../themes/text_styly/app_text_style.dart';

class LocationsCard extends StatelessWidget {
  const LocationsCard({
    Key? key,
    required this.model,
  }) : super(key: key);

  final LocationModel model;

  @override
  Widget build(BuildContext context) {
    // final vm = context.watch<LocationModel>();
    return Column(
      children: [
        ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: Image.asset(
              model.wordImage,
              scale: 0.1,
            )),
        Container(
          decoration: const BoxDecoration(
            color: AppColors.color152A3A,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(model.worldName, style: AppTextStyle.w500s20),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text('Мир • Измерение ${model.reality}',
                      style: AppTextStyle.w400s12)
                ],
              )
            ],
          ),
        ),
      ],
    );
    //  Stack(
    //   children: [
    //     Image.asset(model.wordImage),
    //     Container(
    //       padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    //       color: AppColors.color152A3A,
    //       child: Column(
    //         children: [
    //           Text(
    //             model.worldName,
    //             style: AppTextStyle.w500s20,
    //           ),
    //           Row(
    //             children: [
    //               Text('Мир • Измерение ${model.reality}',
    //                   style: AppTextStyle.w400s12)
    //             ],
    //           )
    //         ],
    //       ),
    //     ),
    //   ],
    // );
  }
}
