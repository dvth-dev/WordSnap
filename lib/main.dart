import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordsnap/app.dart';
import 'package:wordsnap/core/constants/hive_box_name.dart';
import 'package:wordsnap/core/services/hive_service.dart';
import 'package:wordsnap/features/app/bloc/app_bloc.dart';
import 'package:wordsnap/features/settings/data/datasources/setting_local_datasource.dart';
import 'package:wordsnap/features/settings/data/repositories/setting_repository_impl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HiveService.instance.init();
  await HiveService.instance.openRequiredBoxes();
  // dependencies Setting
  final settingRepository = SettingRepositoryImpl(
    SettingLocalDataSourceImpl(
      await HiveService.instance.getBox(HiveBoxName.appSetting),
    ),
  );

  runApp(
    BlocProvider(
      create: (_) => AppBloc(settingRepository: settingRepository),
      child: const MyApp(),
    ),
  );
}
