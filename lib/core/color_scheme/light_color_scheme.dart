import 'package:flutter/material.dart';

const lightColorScheme = ColorScheme.light(
  //   color: context.colorScheme.onSurface.withOpacity(.8),

  ///restaurant
  primary: Color(0xFFFAAC01),

  ///restaurant
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xffFAF2EF),
  onPrimaryContainer: Color(0xffF7F7F7),

  ///restaurant
  secondary: Color(0xFF00810B),

  ///restaurant
  onSecondary: Color(0xFF979797),
  tertiary: Color(0xff023047),
  onTertiary: Color(0xFFFFFFFF),
  error: Color(0xFFF44336),
  errorContainer: Color(0xFF8E0606),
  onError: Color(0xFFFFFFFF),

  ///restaurant
  onErrorContainer: Color(0xFF410E0B),

  ///restaurant
  background: Color(0xFFF5F6F8),

  onBackground: Color(0xFF191C1D),

  ///restaurant
  surface: Color(0xFFFFFFFF),

  ///restaurant
  onSurface: Color(0xFF333333),
  surfaceVariant: Color(0xFFE7E0EC),

  ///restaurant
  onSurfaceVariant: Color(0xFFE5E5E5),

  ///restaurant
  outline: Color(0xFFDEDEDE),
  onInverseSurface: Color(0xFFEFF1F1),

  ///restaurant
  inverseSurface: Color(0xFF677294),
  shadow: Color(0xFF000000),
);

extension ColorExtension on Color {
  Color? get getOnColor {
    switch (value) {
      case 0xFFFB5607:
        return lightColorScheme.onPrimary;
      case 0xFFF3F3F3:
        return const Color(0xff023047);
      default:
        return null;
    }
  }
}
