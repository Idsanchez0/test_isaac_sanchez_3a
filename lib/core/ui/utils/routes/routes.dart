import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:test_isaac_sanchez/features/planets/presentation/controller/planets_controller.dart';
import 'package:test_isaac_sanchez/features/planets/presentation/page/details_planet_page.dart';
import 'package:test_isaac_sanchez/features/planets/presentation/page/list_planets_page.dart';

import '../../../../features/init/presentation/page/splash_screen_page.dart';
import '../../design/templates/cards/error_route.dart';

abstract class AppRoutes {
  static const home = 'home';
  static const planets = 'planets';
  static const planetDetail = 'planetDetail';
}

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: AppRoutes.home,
        builder: (BuildContext context, GoRouterState state) =>
            const SplashScreenPage(),
      ),
      GoRoute(
        path: '/planets',
        name: AppRoutes.planets,
        builder: (BuildContext context, GoRouterState state) =>
            const ListPlanetsPage(),
      ),
      GoRoute(
        path: '/planets/:planet',
        name: AppRoutes.planetDetail,
        builder: (context, state) {
          final planetParam = state.pathParameters['planet'] ?? '';
          final container = ProviderScope.containerOf(context, listen: false);
          final planetsState = container.read(planetsController);
          final exists = (planetsState.listPlanets ?? []).any(
            (p) => (p.name ?? '') == planetParam,
          );
          if (!exists) {
            return const Scaffold(body: ErrorRoute());
          }
          return const DetailsPlanetPage();
        },
      ),
    ],
    errorBuilder: (context, state) => const Scaffold(body: ErrorRoute()),
  );
}
