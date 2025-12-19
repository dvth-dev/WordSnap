import 'package:hive_flutter/adapters.dart';
import 'package:wordsnap/core/constants/hive_keys.dart';
import 'package:wordsnap/features/settings/data/models/setting_model.dart';

import '../constants/hive_box_name.dart';

class HiveService {
  HiveService._();

  static final HiveService _instance = HiveService._();

  static HiveService get instance => _instance;

  Future init() async {
    await Hive.initFlutter();
    _registerAdapterApp();
  }

  Future<void> openRequiredBoxes() async {
    await Hive.openBox<SettingModel>(HiveBoxName.appSetting);
  }

  Future<Box<T>> getBox<T>(String boxName) async {
    if (Hive.isBoxOpen(boxName)) {
      return Hive.box<T>(boxName);
    } else {
      return await Hive.openBox<T>(boxName);
    }
  }

  Future clearBox(String boxName) async {
    final box = Hive.box(boxName);
    box.clear();
  }

  Future deleteBox(String boxName) async {
    final box = Hive.box(boxName);
    box.deleteFromDisk();
  }

  Future closeBox(String boxName) async {
    final box = Hive.box(boxName);
    box.close();
  }

  _registerAdapterApp() {
    if (!Hive.isAdapterRegistered(HiveTypeId.appSetting)) {
      Hive.registerAdapter(SettingModelAdapter());
    }
  }
}
