import 'package:wordsnap/features/settings/data/datasources/setting_local_datasource.dart';
import 'package:wordsnap/features/settings/data/models/setting_model.dart';
import 'package:wordsnap/features/settings/data/repositories/setting_repository.dart';

class SettingRepositoryImpl implements SettingRepository {
  final SettingLocalDataSource _localDataSource;

  SettingRepositoryImpl(this._localDataSource);

  @override
  Future<SettingModel> getSetting() async {
    return await _localDataSource.getSetting();
  }

  @override
  Future<void> saveSetting(SettingModel settingModel) async {
    await _localDataSource.saveSetting(settingModel);
  }

  @override
  Future<void> completeOnboard() async {
    final setting = await _localDataSource.getSetting();

    final settingNew = setting.copyWith(isFirstLaunch: false);

    await _localDataSource.saveSetting(settingNew);
  }

  @override
  Future<void> resetApp() async {
    await _localDataSource.saveSetting(SettingModel.defaultSetting());
  }
}
