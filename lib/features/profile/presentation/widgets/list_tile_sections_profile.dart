import 'package:flutter/material.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';
import 'package:restaurant_customer/core/config/theme/extension_color_scheme.dart';

import '../../../app/presentation/widgets/app_text.dart';

class ListTileSectionsProfile extends StatelessWidget {
   ListTileSectionsProfile({super.key,required this.onTap,required this.nameSection});
  void Function()? onTap;
  String nameSection;
  @override
  Widget build(BuildContext context) {
    return   InkWell(
      onTap: onTap,
      child: ListTile(

        trailing: Icon(Icons.arrow_forward_ios,
          color: context.colorScheme.profileTextColor,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppText.regularText(
              nameSection,
              fontWeight: FontWeight.w400,
             color: context.colorScheme.onSurface.withOpacity(.7),
            ),

          ],
        ),
      ),
    );
  }
}
