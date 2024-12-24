import 'package:flutter/material.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';
import 'package:restaurant_customer/core/config/theme/extension_color_scheme.dart';

import '../../generated/l10n.dart';
import '../../services/navigation/router.dart';

enum OrderStatus {
  pending,
  accept,
  driverAccept,
  onTheWay,
  rejected,
  completed;

  Color get color {
    final context = router.context!;
    return switch (this) {
      pending => context.colorScheme.pendingColor,
      accept => context.colorScheme.systemError[600]!,
      driverAccept => context.colorScheme.systemSuccess[600]!,
      onTheWay => context.colorScheme.primary,
      rejected => context.colorScheme.brandPrimary.shade25,
      completed => context.colorScheme.containerColor,
    };
  }

  String get text {
    return switch (this) {
      pending => S.current.Pending,
      accept => S.current.Accept,
      driverAccept => S.current.Driver_Accept,
      onTheWay => S.current.On_The_Way,
      rejected => S.current.Rejected,
      completed => S.current.Completed,
    };
  }
}

OrderStatus orderStatusFromIndex(int index) {
  return OrderStatus.values[index];
}
