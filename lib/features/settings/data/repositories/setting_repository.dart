import 'package:wordsnap/features/settings/data/models/setting_model.dart';

abstract class SettingRepository {
  Future<SettingModel> getSetting();

  Future<void> saveSetting(SettingModel settingModel);

  Future<void> completeOnboard();

  Future<void> resetApp();
}
