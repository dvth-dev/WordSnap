import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import '../../../../core/constants/hive_keys.dart';

part 'setting_model.g.dart';

@HiveType(typeId: HiveTypeId.appSetting)
class SettingModel extends Equatable {
  @HiveField(0)
  final bool isFirstLaunch;

  const SettingModel({this.isFirstLaunch = true});

  factory SettingModel.defaultSetting() {
    return SettingModel(isFirstLaunch: true);
  }

  SettingModel copyWith({bool? isFirstLaunch}) {
    return SettingModel(isFirstLaunch: isFirstLaunch ?? this.isFirstLaunch);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [isFirstLaunch];
}
