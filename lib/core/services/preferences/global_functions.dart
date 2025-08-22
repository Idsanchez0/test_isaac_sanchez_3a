import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../ui/design/templates/loader/loader.dart';
import '../../ui/design/templates/modals/middle_modal.dart';

class GlobalFunctions {
  static const keyFavorites = 'favorite_planets';
  static const storage = FlutterSecureStorage();

  ///Loading
  loading(context) {
    middleModals.middleModal(
      context,
      (ctx) => const Loader(),
      Colors.transparent,
    );
  }

  Future<List<String>> getFavorites() async {
    final jsonString = await storage.read(key: keyFavorites);
    if (jsonString == null) return [];
    return List<String>.from(json.decode(jsonString));
  }

  /// Agrega un planeta (si no está repetido)
  Future<void> addFavorite(String planetName) async {
    final favorites = await getFavorites();
    if (!favorites.contains(planetName)) {
      favorites.add(planetName);
      await storage.write(key: keyFavorites, value: json.encode(favorites));
    }
  }

  /// Elimina un planeta
  Future<void> removeFavorite(String planetName) async {
    final favorites = await getFavorites();
    favorites.remove(planetName);
    await storage.write(key: keyFavorites, value: json.encode(favorites));
  }

  Future<bool> isFavorite(String planetName) async {
    final favorites = await getFavorites();
    return favorites.contains(planetName);
  }
}

GlobalFunctions globalFunctions = GlobalFunctions();
