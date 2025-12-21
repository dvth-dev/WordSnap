import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/router/app_router.dart';
import 'bloc/app_bloc.dart';
import 'bloc/app_state.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        final appBloc = context.read<AppBloc>();
        final routerConfig = createRouter(appBloc);
        return MaterialApp.router(
          routerConfig: routerConfig,
          debugShowCheckedModeBanner: false,
          // home: _buildHome(state, context),
        );
      },
    );
  }
}
