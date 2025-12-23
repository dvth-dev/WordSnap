import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wordsnap/core/router/router_paths.dart';
import 'package:wordsnap/features/detect_object/bloc/camera_bloc.dart';
import 'package:wordsnap/features/detect_object/bloc/camera_state.dart';
import 'package:wordsnap/features/home/bloc/home_bloc.dart';
import 'package:wordsnap/features/home/bloc/home_event.dart';
import 'package:wordsnap/features/splash/presentation/splash_screen.dart';

import '../../features/detect_object/bloc/camera_event.dart';
import '../../features/detect_object/presentation/camera_active_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/onboard/onboard_screen.dart';

List<GoRoute> routers = [
  GoRoute(path: RouterPath.splash, builder: (_, __) => const SplashScreen()),
  GoRoute(path: RouterPath.onboard, builder: (_, __) => const OnboardScreen()),
  GoRoute(
    path: RouterPath.cameraActive,
    builder:
        (_, __) => BlocProvider(
          create: (_) => CameraBloc()..add(InitialCamera()),
          child: CameraActiveScreen(),
        ),
  ),
  GoRoute(
    path: RouterPath.home,
    builder:
        (_, __) => BlocProvider(
          create: (_) => HomeBloc()..add(HomeStarted()),
          child: const HomeScreen(),
        ),
  ),
];
