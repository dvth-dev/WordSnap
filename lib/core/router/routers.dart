import 'package:go_router/go_router.dart';
import 'package:wordsnap/core/router/router_paths.dart';
import 'package:wordsnap/features/splash/presentation/splash_screen.dart';

import '../../features/home/presentation/home_screen.dart';
import '../../features/onboard/onboard_screen.dart';

List<GoRoute> routers = [
  GoRoute(path: RouterPath.splash, builder: (_, __) => const SplashScreen()),
  GoRoute(path: RouterPath.onboard, builder: (_, __) => const OnboardScreen()),
  GoRoute(path: RouterPath.home, builder: (_, __) => const HomeScreen()),
];
