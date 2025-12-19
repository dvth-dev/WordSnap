import 'package:hive/hive.dart';
import 'package:wordsnap/core/constants/hive_keys.dart';
import 'package:wordsnap/features/settings/data/models/setting_model.dart';

abstract class SettingLocalDataSource {
  Future<SettingModel> getSetting();

  Future<void> saveSetting(SettingModel settingModel);
}

class SettingLocalDataSourceImpl implements SettingLocalDataSource {
  final key = HiveKey.appSettingKey;
  final Box<SettingModel> _box;

  SettingLocalDataSourceImpl(this._box);

  @override
  Future<SettingModel> getSetting() async {
    final SettingModel? settingModel = _box.get(key);

    if (settingModel == null) {
      final defaultSetting = SettingModel.defaultSetting();

      await _box.put(key, defaultSetting);

      return defaultSetting;
    }

    return settingModel;
  }

  @override
  Future<void> saveSetting(SettingModel settingModel) async {
    await _box.put(key, settingModel);
  }
}
