import 'package:flutter/material.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';
import 'package:restaurant_customer/core/config/theme/extension_color_scheme.dart';

extension BoxShadowExtension on BuildContext {
  BoxShadow get getBoxShadow1 => BoxShadow(
        blurRadius: 2,
        spreadRadius: 0,
        offset: const Offset(0, 1),
        color: colorScheme.shadowCard1(0.06),
      );

  BoxShadow get getBoxShadow2 => BoxShadow(
        blurRadius: 3,
        spreadRadius: 0,
        offset: const Offset(0, 1),
        color: colorScheme.shadowCard1(0.1),
      );

  BoxShadow get getBoxShadow3 => BoxShadow(
        blurRadius: 3,
        spreadRadius: 0,
        offset: const Offset(0, 1),
        color: colorScheme.shadowCard1(0.05),
      );

  BoxShadow get getBoxShadow4 => BoxShadow(
        blurRadius: 4,
        spreadRadius: 0,
        offset: const Offset(0, 4),
        color: colorScheme.surface.withOpacity(0.12),
      );

  BoxShadow get getBoxShadow5 => BoxShadow(
        blurRadius: 2,
        spreadRadius: 0,
        offset: const Offset(0, 1),
        color: colorScheme.shadowCard1(0.05),
      );

  BoxShadow get getBoxShadow6 => BoxShadow(
        blurRadius: 2,
        spreadRadius: 0,
        offset: const Offset(0, 1),
        color: colorScheme.shadowCard1(0.04),
      );

  BoxShadow get getBoxShadow7 => BoxShadow(
        blurRadius: 2,
        spreadRadius: 0,
        offset: const Offset(0, 1),
        color: colorScheme.shadowCard1(0.1),
      );
  BoxShadow get getBoxShadow8 => BoxShadow(
        blurRadius: 2,
        spreadRadius: 0,
        offset: const Offset(0, 1),
        color: colorScheme.shadowCard2(0.04),
      );

  BoxShadow get getBoxShadow9 => BoxShadow(
        blurRadius: 3,
        spreadRadius: 0,
        offset: const Offset(0, 1),
        color: colorScheme.shadowCard2(0.06),
      );

  BoxShadow get getBoxShadow10 => BoxShadow(
        blurRadius: 2,
        spreadRadius: 0,
        offset: const Offset(0, 2),
        color: colorScheme.shadowCard3(0.16),
      );

  BoxShadow get getBoxShadow11 => BoxShadow(
        blurRadius: 4,
        spreadRadius: 0,
        offset: const Offset(0, 4),
        color: colorScheme.shadowCard3(0.16),
      );

  BoxShadow get getBoxShadow12 => BoxShadow(
        blurRadius: 2,
        spreadRadius: 0,
        offset: const Offset(0, 1),
        color: colorScheme.shadowCard3(0.05),
      );
  BoxShadow get getBoxShadow13 => BoxShadow(
        blurRadius: 1,
        spreadRadius: 0,
        offset: const Offset(0, 1),
        color: colorScheme.shadowCard1(0.08),
      );
}
