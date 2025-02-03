import 'package:ceiba_ui/ceiba_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_ceiba/app/routes/routes.dart';
import 'package:test_ceiba/feature/main_dashboard/bloc/user_bloc.dart';
import 'package:test_ceiba/injection/injection_container.dart' as injection;
import 'package:test_ceiba/l10n/l10n.dart';
import 'package:test_ceiba/app/routes/router_config.dart';

/// {@template app}
/// The `App` class is a Dart class that represents the main application
/// and sets up the theme, localization, and routing.
/// {@endtemplate}
class App extends StatelessWidget {
  /// {@macro app}
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final router = CustomRouterConfig().router;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => injection.sl<UserBloc>(),
        ),
      ],
      child: Builder(
        builder: (context) {
          return kIsWeb
              ? MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  theme: const AppTheme().themeData,
                  title: 'Pase de Guardia',
                  localizationsDelegates: AppLocalizations.localizationsDelegates,
                  supportedLocales: AppLocalizations.supportedLocales,
                  routeInformationProvider: router.routeInformationProvider,
                  routeInformationParser: router.routeInformationParser,
                  routerDelegate: router.routerDelegate,
                  scaffoldMessengerKey: rootScaffoldMessengerKey,
                )
              : MediaQuery(
                  data: MediaQuery.of(context)
                      .copyWith(textScaler: MediaQuery.of(context).textScaler.clamp(minScaleFactor: 0.75, maxScaleFactor: 1.25)),
                  child: MaterialApp.router(
                    theme: const AppTheme().themeData,
                    title: 'Pase de Guardia',
                    debugShowCheckedModeBanner: false,
                    localizationsDelegates: AppLocalizations.localizationsDelegates,
                    supportedLocales: AppLocalizations.supportedLocales,
                    routeInformationProvider: router.routeInformationProvider,
                    routeInformationParser: router.routeInformationParser,
                    routerDelegate: router.routerDelegate,
                    scaffoldMessengerKey: rootScaffoldMessengerKey,
                  ),
                );
        },
      ),
    );
  }
}
