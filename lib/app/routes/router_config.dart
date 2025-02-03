import 'package:ceiba_ui/ceiba_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_ceiba/app/routes/routes_names.dart';
import 'package:test_ceiba/feature/home/view/home_page.dart';
import 'package:test_ceiba/feature/main_dashboard/view/main_dashboard_page.dart';
import 'package:test_ceiba/feature/main_dashboard/widgets/detail.dart';

part 'router_handlers.dart';

/// Navigator keys
final rootNavigatorKey = GlobalKey<NavigatorState>();
final homeNavigatorKey = GlobalKey<NavigatorState>();

/// The rootScaffoldMessengerKey is a global key that is used to access the
/// rootScaffold navigator.
final rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class CustomRouterConfig {
  static final _router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: rootNavigatorKey,
    initialLocation: RoutesNames.home,
    errorPageBuilder: (context, state) {
      return NoTransitionPage(
        child: UnderConstruction(title: state.matchedLocation),
      );
    },
    routes: [
      /// Main ShellRoute for authenticated users
      ShellRoute(
        navigatorKey: homeNavigatorKey,
        builder: _homeHandler,
        routes: [
          /// Home route
          GoRoute(
            path: RoutesNames.home,
            parentNavigatorKey: homeNavigatorKey,
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                child: MainDashboardPage(),
              );
            },
          ),
          GoRoute(
            path: RoutesNames.detail,
            parentNavigatorKey: homeNavigatorKey,
            pageBuilder: _detailPageHandler,
          ),

          /// Nested routes (shared structure for both health and management)
        ],
      ),
    ],
  );

  /// Expose the router instance
  GoRouter get router => _router;
}

/// Pop until a specific path
void popUntilPath(String routePath, BuildContext context) {
  final router = GoRouter.of(context);
  while ('${router.routeInformationProvider.value.uri}' != routePath) {
    if (!router.canPop()) return;
    router.pop();
  }
}
