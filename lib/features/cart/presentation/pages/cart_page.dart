import 'package:flutter/material.dart';

import '../../../app/presentation/widgets/page_layout_builder.dart';
import 'mobile/cart_page_mobile.dart';

class CartPage extends StatelessWidget {
  static String get name => "CartPage";

  static String get path => "CartPage";

  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageLayoutBuilder(
      mobile: (context) => const CartPageMobile(),
    );
  }
}
