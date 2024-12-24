import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';

class UIConstants {
  static EdgeInsets horizontalListView35 = EdgeInsets.symmetric(horizontal: screenPadding35.w);
  static EdgeInsets horizontalListView20 = EdgeInsets.symmetric(horizontal: screenPadding20.w);
  static EdgeInsets verticalListView35 = EdgeInsets.symmetric(vertical: screenPadding35.w);
  static EdgeInsets verticalListView20 = EdgeInsets.symmetric(vertical: screenPadding20.w);

  static REdgeInsets paddingBetweenTopListViewAndListView = REdgeInsets.only(top: 32, bottom: 16);

  static double spacingMd = 8;
  static double screenPadding35 = 35;
  static double screenPadding32 = 32;
  static double screenPadding20 = 20;

  ///Tracking Order page Constraint

  static EdgeInsets horizontalListView = EdgeInsets.symmetric(horizontal: 35.w);
  static EdgeInsets verticalListView = EdgeInsets.symmetric(vertical: 35.w);
  // static REdgeInsets paddingBetweenTopListViewAndListView = REdgeInsets.only(top: 32, bottom: 16);
  static double screenPadding = 35;
  static double screenPaddingSmall = 20;

  static double heightMapBottomSheetExpanded = 430.h;
  static double heightMapBottomSheetIndicator = 50.h;
  static double persistentContentBottomSheetHeaderWithoutIndicator = 95.h;

  static getShadow(BuildContext context) => context.colorScheme.outlineVariant.withOpacity(0.25);

  static List<BoxShadow> containerShadow(BuildContext context, {Offset? offset, Color? color}) => [
    BoxShadow(
      color: color ?? context.colorScheme.shadow.withOpacity(0.1),
      offset: offset ?? const Offset(0, 1),
      blurRadius: 2,
    )
  ];
  static List<BoxShadow> shadowLight(BuildContext context, {Offset? offset}) => [
    BoxShadow(
      color: context.colorScheme.shadow.withOpacity(.05),
      blurRadius: 2,
      offset: offset ?? const Offset(0, 1),
    )
  ];

  static double get fullHeightContact =>
      heightMapBottomSheetIndicator + persistentContentBottomSheetHeaderWithoutIndicator;
}
