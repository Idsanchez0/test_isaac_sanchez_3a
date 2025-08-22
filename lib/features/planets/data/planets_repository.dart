import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:test_isaac_sanchez/core/newtwork/network.dart';
import 'package:test_isaac_sanchez/features/planets/domain/planets_model.dart';

class PlanetsRepository {
  PlanetsRepository();

  Future<List<PlanetsModel>> getPlanets() async {
    try {
      final response = await http.get(Uri.parse(network.backend.toString()));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        List<PlanetsModel> planets = (data['data'] as List)
            .map((value) => PlanetsModel.fromJson(value))
            .toList();
        return planets;
      } else {
        throw response;
      }
    } catch (e) {
      rethrow;
    }
  }
}

final planetsRepositoryProvider = Provider<PlanetsRepository>(
  (ref) => PlanetsRepository(),
);
