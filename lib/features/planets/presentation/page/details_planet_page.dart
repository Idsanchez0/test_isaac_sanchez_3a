import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_isaac_sanchez/core/ui/utils/paths/images/images_ui.dart';
import 'package:test_isaac_sanchez/features/planets/presentation/controller/planets_controller.dart';
import 'package:test_isaac_sanchez/features/planets/presentation/widgets/details_distribution.dart';

class DetailsPlanetPage extends ConsumerStatefulWidget {
  const DetailsPlanetPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DetailsPlanetPageState();
}

class _DetailsPlanetPageState extends ConsumerState<DetailsPlanetPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  initData() {
    var state = ref.read(planetsController);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Container(
          padding: EdgeInsetsGeometry.symmetric(
            vertical: 5.sp,
            horizontal: 10.sp,
          ),
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagesUI.background),
              fit: BoxFit.cover,
            ),
          ),
          child: DetailsDistribution(ref: ref),
        ),
      ),
    );
  }
}
