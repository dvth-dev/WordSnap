import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../app/bloc/app_bloc.dart';
import '../../app/bloc/app_event.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 2500))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              context.read<AppBloc>().add(SplashCompleted());
            }
          })
          ..forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.stop();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/anim/splash.json', controller: _controller),
      ),
    );
  }
}
