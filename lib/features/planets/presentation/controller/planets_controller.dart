import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_isaac_sanchez/features/planets/data/planets_repository.dart';
import 'package:test_isaac_sanchez/features/planets/domain/planets_model.dart';

import '../state/planets_state.dart';

class PlanetsController extends StateNotifier<PlanetsState> {
  PlanetsController({required this.planetsRepository}) : super(PlanetsState());
  final PlanetsRepository planetsRepository;

  Future<bool> getPlanets() async {
    try {
      List<PlanetsModel> listPlanets = await planetsRepository.getPlanets();
      if (listPlanets.isNotEmpty) {
        state = state.copyWith(listPlanets: listPlanets);
        return true;
      } else {
        log('Error al obtener la lista de planetas');
        return false;
      }
    } catch (e) {
      log('${"error".tr()}: $e');
      rethrow;
    }
  }

  updatePlanetSelected(PlanetsModel? data) {
    state = state.copyWith(planetSelected: data);
  }
}

final planetsController =
    StateNotifierProvider<PlanetsController, PlanetsState>((ref) {
      return PlanetsController(
        planetsRepository: ref.watch(planetsRepositoryProvider),
      );
    });
