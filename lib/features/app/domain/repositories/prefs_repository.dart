import 'package:flutter/material.dart';
import 'package:restaurant_customer/services/language_service.dart';

abstract class StorageRepository {
  Future<String?> get token;
  Future<String?> get refreshToken;
  Future<ThemeMode> get getTheme;
  Future<String?> get getLanguage;
  Future<void> saveToken(String token);
  Future<void> saveRefreshToken(String token);

  Future<void> saveTheme(ThemeMode themeMode);

  Future<void> clearUser();
  Future<void> saveLanguage(String lang);


  Future<bool> isTokenExpired([String? token]);
  Future<bool> hastToken();

}
