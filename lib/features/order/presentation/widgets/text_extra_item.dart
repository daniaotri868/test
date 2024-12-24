import 'package:flutter/material.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';
import 'package:restaurant_customer/core/config/theme/extension_color_scheme.dart';

import '../../../app/presentation/widgets/app_text.dart';

class TextExtraItem extends StatelessWidget {
  const TextExtraItem({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return AppText.footnote(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      fontWeight: FontWeight.w500,
      color: context.colorScheme.extraItemColor,
    );
  }
}
