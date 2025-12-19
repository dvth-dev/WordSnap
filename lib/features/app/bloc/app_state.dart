import 'package:equatable/equatable.dart';
import 'package:wordsnap/features/settings/data/models/setting_model.dart';

abstract class AppState extends Equatable {
  @override
  List<Object> get props => [];
}

class AppLoadingState extends AppState {}

class AppFirstLaunchState extends AppState {
  final SettingModel settingModel;

  AppFirstLaunchState({required this.settingModel});

  @override
  // TODO: implement props
  List<Object> get props => [settingModel];
}

class AppReadyState extends AppState {}

class AppErrorState extends AppState {}
