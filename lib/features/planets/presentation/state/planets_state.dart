import 'package:test_isaac_sanchez/features/planets/domain/planets_model.dart';

class PlanetsState {
  List<PlanetsModel>? listPlanets;
  PlanetsModel? planetSelected;

  PlanetsState({this.listPlanets, this.planetSelected});

  PlanetsState copyWith({
    List<PlanetsModel>? listPlanets,
    PlanetsModel? planetSelected,
  }) {
    return PlanetsState(
      listPlanets: listPlanets ?? this.listPlanets,
      planetSelected: planetSelected ?? this.planetSelected,
    );
  }
}
