import 'package:flutter/src/material/app.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:restaurant_customer/common/constant/configuration/prefs_key.dart';
import 'package:restaurant_customer/services/language_service.dart';

import '../../domain/repositories/prefs_repository.dart';

@Injectable(as: StorageRepository)
class StorageRepositoryImpl implements StorageRepository {
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  @override
  Future<bool> isTokenExpired([String? token]) async {
    final String? accessToken = token ?? await this.token;

    if (accessToken == null || accessToken.isEmpty) return false;

    return JwtDecoder.isExpired(accessToken);
  }

  @override
  Future<void> saveToken(String token) async =>
      await secureStorage.write(key: PrefsKey.token, value: token);

  @override
  Future<void> saveRefreshToken(String refreshToken) async =>
      await secureStorage.write(
          key: PrefsKey.refreshToken, value: refreshToken);

  @override
  Future<void> saveTheme(ThemeMode themeMode) async =>
      await secureStorage.write(key: PrefsKey.theme, value: themeMode.name);

  @override
  Future<String?> get token async =>
      await secureStorage.read(key: PrefsKey.token);

  @override
  Future<String?> get refreshToken async =>
      await secureStorage.read(key: PrefsKey.refreshToken);

  @override
  Future<ThemeMode> get getTheme async {
    final res = await secureStorage.read(key: PrefsKey.theme);
    if (res == null) {

      return ThemeMode.light;
    }
    return ThemeMode.dark;
  }

  @override
  Future<bool> hastToken() async {
    final String? token = await this.token;
    return token != null && token.isNotEmpty;
  }

  @override
  Future<void> clearUser() async {
    await secureStorage.delete(key: PrefsKey.token);
    await secureStorage.delete(key: PrefsKey.refreshToken);
  }

  @override
  Future<String?> get getLanguage async{
    return await secureStorage.read(key: PrefsKey.lang)??'';

  }

  @override
  Future<void> saveLanguage(String lang) async{

    await secureStorage.write(key: PrefsKey.lang, value: lang);
  }
}
