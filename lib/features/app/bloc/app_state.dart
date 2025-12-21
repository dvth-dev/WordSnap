import 'package:equatable/equatable.dart';
import 'package:wordsnap/features/settings/data/models/setting_model.dart';

abstract class AppState extends Equatable {
  @override
  List<Object> get props => [];
}

class AppSplashState extends AppState {}

class AppOnboardState extends AppState {
  final SettingModel settingModel;

  AppOnboardState({required this.settingModel});

  @override
  // TODO: implement props
  List<Object> get props => [settingModel];
}

class AppHomeState extends AppState {}

class AppErrorState extends AppState {}
