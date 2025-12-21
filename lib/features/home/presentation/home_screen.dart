import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordsnap/features/app/bloc/app_event.dart';

import '../../app/bloc/app_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
}
