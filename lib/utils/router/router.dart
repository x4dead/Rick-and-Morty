import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/pages/characters/characters_page.dart';
import 'package:rick_and_morty/pages/episodes/episode_screen.dart';
import 'package:rick_and_morty/pages/scaffold_navigation_page.dart';
import 'package:rick_and_morty/pages/location/location_screen.dart';
import 'package:rick_and_morty/utils/router/fade_transition.dart';

final navigatorKey = GlobalKey<NavigatorState>();

//TODO: ПЕРЕДЕЛАТЬ РОУТЕР
class AppRouter {
  static final shellNavigatorKey = GlobalKey<NavigatorState>();
  static final sectionShellKey = GlobalKey<NavigatorState>();
  static final GoRouter router = GoRouter(
      navigatorKey: navigatorKey,
      debugLogDiagnostics: true,
      observers: [GoRouterObserver()],
      initialLocation: '/',
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          redirect: (_, __) => '/characters',
        ),
        StatefulShellRoute.indexedStack(
            pageBuilder: (BuildContext context, GoRouterState state,
                    StatefulNavigationShell navigationShell) =>
                FadeTransitionPage(
                  key: state.pageKey,
                  child: ScaffoldNavPage(navigationShell: navigationShell),
                ),
            branches: [
              StatefulShellBranch(
                routes: <RouteBase>[
                  GoRoute(
                    path: '/characters',
                    pageBuilder: (BuildContext context, GoRouterState state) =>
                        FadeTransitionPage(
                            key: state.pageKey,
                            child: const AllCharacterScreen()),
                    routes: const <RouteBase>[
                      //!TODO Роуты для Профиля
                      // GoRoute(
                      //   path: 'details',
                      //   builder: (BuildContext context, GoRouterState state) =>
                      //       const DetailsScreen(label: 'A'),
                      // ),
                    ],
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: <RouteBase>[
                  GoRoute(
                    path: '/locations',
                    pageBuilder: (BuildContext context, GoRouterState state) =>
                        FadeTransitionPage(
                            key: state.pageKey,
                            child: const Center(child: Text('Coming soon'))),
                    routes: const <RouteBase>[],
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: <RouteBase>[
                  GoRoute(
                    path: '/episodes',
                    pageBuilder: (BuildContext context, GoRouterState state) =>
                        FadeTransitionPage(
                            key: state.pageKey,
                            child: const Center(child: Text('Coming soon'))),
                    routes: const <RouteBase>[],
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: <RouteBase>[
                  GoRoute(
                    path: '/settings',
                    pageBuilder: (BuildContext context, GoRouterState state) =>
                        FadeTransitionPage(
                            key: state.pageKey,
                            child: const Center(child: Text('Coming soon'))),
                    routes: const <RouteBase>[],
                  ),
                ],
              ),
            ]),
      ],
      errorBuilder: (context, state) => Center(child: Text('Not found'))
      // NotFoundView(
      // key: state.pageKey,
      // )
      );
}

// class RT extends GoRouteInformationParser {
//   RT({required super.configuration, required super.onParserException});
//   @override
//   Future<RouteMatchList> parseRouteInformation(
//       RouteInformation routeInformation) async {
//     if (routeInformation.uri.path == '/') {
//       // The user entered the URL in the browser's address bar
//       // Handle the initial route here
//       return RouteMatchList(
//           matches: [

//           ],
//           uri: routeInformation.uri,
//           pathParameters: routeInformation.state as Map<String, String>);
//     } else {
//       // The route information was triggered by a link or by internal navigation
//       // Parse the route information and return a MyConfiguration object
//       return fromRouteInformation(routeInformation);
//     }
//   }
// }

class GoRouterObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log('MyTest didPush: $route');
    log('MyTest didPush pref: $previousRoute');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log('MyTest didPop: $route');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log('MyTest didRemove: $route');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    log('MyTest didReplace: $newRoute');
  }
}
