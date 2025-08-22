import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:test_isaac_sanchez/core/services/preferences/global_functions.dart';
import 'package:test_isaac_sanchez/core/ui/design/atoms/text_field/custom_text_field.dart';
import 'package:test_isaac_sanchez/core/ui/utils/paths/animations/animations_ui.dart';
import 'package:test_isaac_sanchez/features/planets/presentation/controller/planets_controller.dart';
import 'package:test_isaac_sanchez/features/planets/presentation/widgets/list_planets.dart';

import '../../../../core/ui/utils/paths/images/images_ui.dart';
import '../../domain/planets_model.dart';

class ListPlanetsPage extends ConsumerStatefulWidget {
  const ListPlanetsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ListPlanetsPageState();
}

class _ListPlanetsPageState extends ConsumerState<ListPlanetsPage> {
  TextEditingController search = TextEditingController();
  List<PlanetsModel> suggestionsFilter = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      if (mounted) initData(context);
    });
  }

  initData(context) async {
    globalFunctions.loading(context);
    final controller = ref.read(planetsController.notifier);
    bool response = await controller.getPlanets();
    Navigator.pop(context);
    if (response) {
      final state = ref.watch(planetsController);
      setState(() {
        suggestionsFilter = state.listPlanets ?? [];
      });
      search.addListener(onSearchPlanet);
    } else {}
  }

  void onSearchPlanet() async {
    String searchText = search.text.toLowerCase().trim();
    final state = ref.watch(planetsController);
    List<PlanetsModel> allPlanets = state.listPlanets ?? [];
    setState(() {
      if (searchText.isEmpty) {
        suggestionsFilter = allPlanets;
      } else {
        suggestionsFilter = allPlanets.where((item) {
          final matchText = [
            item.name,
            item.description,
            item.orbitalDistanceKm,
            item.equatorialRadiusKm,
            item.volumeKm3,
            item.densityGCm3,
            item.surfaceGravityMS2,
            item.escapeVelocityKmh,
            item.dayLengthEarthDays,
            item.yearLengthEarthDays,
            item.orbitalSpeedKmh,
            item.atmosphereComposition,
            item.moons,
          ].whereType<String>().map((e) => e.toLowerCase());
          return matchText.any((text) => text.contains(searchText));
        }).toList();
      }
    });
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
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagesUI.background),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  child: CustomTextField(
                    controller: search,
                    height: 20.sp,
                    iconSuffix: PhosphorIcons.magnifyingGlass(),
                    inputType: TextInputType.streetAddress,
                    enable: true,
                    hintText: 'search-planet'.tr(),
                    onChangeData: (x) {},
                    isFocused: false,
                  ),
                ),
                SizedBox(height: 10.sp),
                ListPlanets(suggestionsFilter: suggestionsFilter, ref: ref),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
