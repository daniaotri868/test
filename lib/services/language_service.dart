import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';

enum LangCode { ar, en }

class LanguageService {
  static late Locale currentLanguage;
  static late String languageCode;
  static late bool rtl;

  final BuildContext context;
  static LanguageService? _instance;

  LanguageService._singleton(this.context) {
    currentLanguage = _currentLanguage;
    languageCode = _languageCode;
    rtl = _rtl;
  }

  factory LanguageService(BuildContext context) {
    if (_instance != null) {
      if (context.locale.languageCode != languageCode) {
        return LanguageService._singleton(context);
      }
      return _instance!;
    }
    return LanguageService._singleton(context);
  }

  Locale get _currentLanguage => Localizations.localeOf(context);

  String get _languageCode => _currentLanguage.languageCode;

  bool get _rtl => context.locale == localMap[LangCode.ar]!;

  static const List<Locale> supportedLocales = [Locale('ar'), Locale('en')];

  static const Locale defaultLocale = Locale('ar');

  static const Map<LangCode, Locale> localMap = {
    LangCode.en: Locale('en'),
    LangCode.ar: Locale('ar'),
  };

  static const Map<String, Locale> mapLanguageCodeToLocale = {
    'en': Locale('en'),
    'ar': Locale('ar'),
  };

  static const Map<String, LangCode> languageNameAndLanguageCode = {
    'English': LangCode.en,
    'Arabic': LangCode.ar,
  };
}
