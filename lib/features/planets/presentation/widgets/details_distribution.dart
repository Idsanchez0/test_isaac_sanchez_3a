import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_isaac_sanchez/core/services/preferences/responsive_helper.dart';
import 'package:test_isaac_sanchez/features/planets/presentation/controller/planets_controller.dart';

import 'image_card.dart';
import 'infomation_card.dart';

class DetailsDistribution extends StatefulWidget {
  final WidgetRef ref;

  const DetailsDistribution({super.key, required this.ref});

  @override
  State<DetailsDistribution> createState() => _DetailsDistribution();
}

class _DetailsDistribution extends State<DetailsDistribution> {
  @override
  Widget build(BuildContext context) {
    var state = widget.ref.watch(planetsController);
    return ResponsiveHelper.isDesktop(context)
        ? Row(
            children: [
              ImageCard(image: state.planetSelected!.image.toString()),
              SizedBox(width: 10.sp),
              Expanded(child: InformationCard(data: state.planetSelected!)),
            ],
          )
        : SingleChildScrollView(
            child: Column(
              children: [
                ImageCard(image: state.planetSelected!.image.toString()),
                SizedBox(height: 10.sp),
                InformationCard(data: state.planetSelected!),
              ],
            ),
          );
  }
}
