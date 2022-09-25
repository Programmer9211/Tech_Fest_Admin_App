import 'package:get_storage/get_storage.dart';

import '../../../const/app_const/app_keys.dart';

class Storage {
  const Storage._();

  static final GetStorage storage = GetStorage();

  static Future<void> saveValue(String key, value) => storage.write(key, value);

  static getValue(String key) => storage.read(key);

  static bool hasData(String key) => storage.hasData(key);

  static Future<void> removeValue(String key) => storage.remove(key);

  static Future<void> clearStorage() => storage.erase();

  static Future<void> get setDarkTheme =>
      storage.write(AppKeys.theme, AppKeys.darkTheme);

  static Future<void> get setLightTheme =>
      storage.write(AppKeys.theme, AppKeys.lightTheme);

  static String get getCurrentTheme =>
      storage.read(AppKeys.theme) ?? AppKeys.lightTheme;

  static bool get isAppOpened =>
      Storage.hasData('First') && Storage.getValue('First');
  static Future<void> setAppOpened() => Storage.saveValue('First', true);
}
