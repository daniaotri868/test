import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:restaurant_customer/services/storage_service/storage_key.dart';

import '../../features/app/domain/entities/profile.dart';

@lazySingleton
class HiveService {
  static late Box hiveBox;

  static String? language;

  static Future<void> initialHive() async {
    Hive.init((await getApplicationCacheDirectory()).path);

    hiveBox = await Hive.openBox('humy_driver');
    language = await getLanguage;
  }

  static Future<void> setProfileModel(Profile profile) {
    return hiveBox.putAll({
      StorageKey.firstName: profile.firstName,
      StorageKey.lastName: profile.lastName,
    });
  }

  Future<String> get getFullName async =>
      "${hiveBox.get(StorageKey.firstName, defaultValue: "")} ${hiveBox.get(StorageKey.lastName, defaultValue: "")}";

  Future<String> get getImage async =>
      hiveBox.get(StorageKey.image, defaultValue: "");

  static Future<void> setImage(String image) async =>
      hiveBox.put(StorageKey.image, image);

  Future<String> get getCurrency async => hiveBox.get(StorageKey.currency);

  // Language
  static Future<String?> get getLanguage async {
    return (await hiveBox.get(StorageKey.language));
  }

  static Future<void> setLanguage(String lang) async {
    await hiveBox.put(StorageKey.language, lang);
    language = await getLanguage;
  }

  // Saved Notifications Ids
  //   static final savedNotificationsIds = "savedNotificationsIds";
  // static Future<List<String>?> get getSavedNotsIds async {
  //   return (await hiveBox.get(StorageKey.savedNotificationsIds));
  // }

  // static Future<void> setSavedNotsIds(List<String> ids) async {
  //   await hiveBox.put(StorageKey.savedNotificationsIds, ids);
  // }
}
