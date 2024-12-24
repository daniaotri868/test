import 'package:flutter/material.dart';

import '../../../app/presentation/widgets/page_layout_builder.dart';
import 'mobile/order_details_page_mobile.dart';


class OrderDetailsPage extends StatelessWidget {
  static String get name => "OrderDetailsPage";

  static String get path => "OrderDetailsPage";
  final String orderId;

  const OrderDetailsPage({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return PageLayoutBuilder(
      mobile: (context) =>   OrderDetailsPageMobile(orderId: orderId,),
    );
  }
}
