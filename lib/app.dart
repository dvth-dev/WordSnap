import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordsnap/features/app/bloc/app_event.dart';

import 'features/app/bloc/app_bloc.dart';
import 'features/app/bloc/app_state.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return MaterialApp(home: _buildHome(state, context));
      },
    );
  }

  Widget _buildHome(AppState state, BuildContext context) {
    if (state is AppLoadingState) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.read<AppBloc>().add(AppInit());
      });

      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (state is AppFirstLaunchState) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 30.0,
            children: [
              Text('First Launch App - Show Onboard'),
              InkWell(
                onTap: () {
                  context.read<AppBloc>().add(OnboardCompleted());
                },
                child: Container(
                  height: 30,
                  width: 300,
                  color: Colors.blueGrey,
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (state is AppReadyState) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 30.0,
            children: [
              Text('App Ready - Show Onboard'),
              InkWell(
                onTap: () {
                  context.read<AppBloc>().add(ResetApp());
                },
                child: Container(height: 30, width: 300, color: Colors.yellow),
              ),
            ],
          ),
        ),
      );
    }

    return SizedBox();
  }
}
