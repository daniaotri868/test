import 'package:flutter/material.dart';

import '../../../app/presentation/widgets/page_layout_builder.dart';
import 'mobile/order_page_mobile.dart';

class OrderPage extends StatelessWidget {
  static String get name => "OrderPage";
  static String get path => "OrderPage";

  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageLayoutBuilder(
      mobile: (context) => OrderPageMobile(),
    );
  }
}
