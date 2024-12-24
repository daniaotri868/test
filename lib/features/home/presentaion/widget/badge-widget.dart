import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';

class BadgeWidget extends StatelessWidget {
  const BadgeWidget({
    super.key,
    required this.showBadge,

    this.badgeContent,
    required this.child
  });
  final bool showBadge;

  final Widget? badgeContent;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return badges.Badge(
        position: badges.BadgePosition.topStart(top: -15, start: 15,),
        showBadge:   showBadge,
        badgeContent:badgeContent,
        badgeStyle: badges.BadgeStyle(
          shape: badges.BadgeShape.circle,
          badgeColor: context.colorScheme.errorContainer,
          padding:  REdgeInsets.all(6),
          borderRadius: BorderRadius.circular(3),
          elevation: 0,
        ),
        child:  child);
  }
}
