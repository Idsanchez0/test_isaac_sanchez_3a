import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:test_isaac_sanchez/core/services/preferences/global_functions.dart';
import 'package:test_isaac_sanchez/features/planets/domain/planets_model.dart';
import 'package:test_isaac_sanchez/features/planets/presentation/controller/planets_controller.dart';

import '../../../../core/services/preferences/responsive_helper.dart';
import '../../../../core/ui/design/templates/cards/transparent_card.dart';
import '../../../../core/ui/utils/colors/colors_ui.dart';
import 'item_planet_card.dart';

class ListPlanets extends StatefulWidget {
  final List<PlanetsModel> suggestionsFilter;
  final WidgetRef ref;

  const ListPlanets({
    super.key,
    required this.suggestionsFilter,
    required this.ref,
  });

  @override
  State<ListPlanets> createState() => _ListPlanets();
}

class _ListPlanets extends State<ListPlanets> {
  List<String> favorites = [];

  @override
  void initState() {
    super.initState();
    loadFavorites();
  }

  void loadFavorites() async {
    final favorite = await globalFunctions.getFavorites();
    if (mounted) {
      setState(() => favorites = favorite);
    }
  }

  @override
  Widget build(BuildContext context) {
    var controller = widget.ref.watch(planetsController.notifier);
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: ResponsiveHelper.isDesktop(context)
            ? widget.suggestionsFilter.length >= 2
                  ? 2
                  : 1
            : 1,
        childAspectRatio: ResponsiveHelper.isDesktop(context)
            ? 0.8.sp
            : ResponsiveHelper.isTablet(context)
            ? 2.sp
            : 1.5.sp,
        crossAxisSpacing: 15.sp,
        mainAxisSpacing: 15.sp,
      ),
      itemCount: widget.suggestionsFilter.length,
      itemBuilder: (context, index) {
        PlanetsModel data = widget.suggestionsFilter[index];
        bool isFavorite = favorites.contains(data.name);
        return GestureDetector(
          onTap: () {
            controller.updatePlanetSelected(null);
            controller.updatePlanetSelected(data);
            context.go('/planets/${data.name.toString()}');
          },
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              TransparentCard(child: ItemPlanetCard(data: data)),
              Positioned(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.sp,
                    vertical: 3.sp,
                  ),
                  child: GestureDetector(
                    onTap: () async {
                      if (!isFavorite) {
                        globalFunctions.addFavorite(data.name.toString());
                        setState(() => favorites.add(data.name.toString()));
                      } else {
                        globalFunctions.removeFavorite(data.name.toString());
                        setState(() => favorites.remove(data.name.toString()));
                      }
                    },
                    child: Icon(
                      isFavorite
                          ? PhosphorIconsFill.heart
                          : PhosphorIcons.heart(),
                      color: isFavorite
                          ? colorsUI.error500
                          : colorsUI.neutral200,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
