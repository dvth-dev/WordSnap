import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wordsnap/core/router/router_paths.dart';
import 'package:wordsnap/core/router/routers.dart';
import 'package:wordsnap/features/app/bloc/app_bloc.dart';
import 'package:wordsnap/features/app/bloc/app_state.dart';

class GoRouterRefreshStream extends ChangeNotifier {
  late final StreamSubscription<dynamic> _subscription;

  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.listen((_) => notifyListeners());
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

GoRouter createRouter(AppBloc appBloc) {
  return GoRouter(
    initialLocation: RouterPath.splash,
    refreshListenable: GoRouterRefreshStream(appBloc.stream),
    redirect: (context, state) {
      final appState = appBloc.state;
      final currentLocation = state.matchedLocation;

      if (appState is AppSplashState) {
        return currentLocation == RouterPath.splash ? null : RouterPath.splash;
      }

      if (appState is AppOnboardState) {
        return currentLocation == RouterPath.onboard
            ? null
            : RouterPath.onboard;
      }

      if (appState is AppHomeState) {
        return currentLocation == RouterPath.home ? null : RouterPath.home;
      }

      return null;
    },
    routes: routers,
  );
}
