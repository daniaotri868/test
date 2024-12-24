import 'package:flutter/material.dart';
import 'package:restaurant_customer/features/cart/presentation/pages/mobile/saved_coupon_page_mobile.dart';

import '../../../app/presentation/widgets/page_layout_builder.dart';

class SavedCouponPage extends StatelessWidget {
  static String get name => "SavedCouponPage";

  static String get path => "SavedCouponPage";

  const SavedCouponPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageLayoutBuilder(
      mobile: (context) => const SavedCouponPageMobile(),
    );
  }
}
