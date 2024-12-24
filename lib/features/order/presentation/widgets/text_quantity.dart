import 'package:flutter/cupertino.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';

import '../../../app/presentation/widgets/app_text.dart';

class TextQuantity extends StatelessWidget {
  const TextQuantity({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return AppText.labelRegular(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text,
      color: context.colorScheme.onSecondary,
      fontWeight: FontWeight.w500,
    );
  }
}
