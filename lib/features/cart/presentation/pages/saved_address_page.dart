import 'package:flutter/material.dart';
import 'package:restaurant_customer/features/cart/presentation/pages/mobile/saved_address_page_mobile.dart';

import '../../../app/presentation/widgets/page_layout_builder.dart';

class SavedAddressPage extends StatelessWidget {
  static String get name => "SavedLocationPage";

  static String get path => "SavedLocationPage";

  const SavedAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageLayoutBuilder(
      mobile: (context) => SavedAddressPageMobile(),
    );
  }
}
