import 'package:flutter/material.dart';
import 'package:restaurant_customer/features/cart/presentation/pages/mobile/add_address_page_mobile.dart';

import '../../../app/presentation/widgets/page_layout_builder.dart';

class AddAddressPage extends StatelessWidget {
  static String get name => "AddAddressPage";

  static String get path => "AddAddressPage";

  const AddAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageLayoutBuilder(
      mobile: (context) => const AddAddressPageMobile(),
    );
  }
}
