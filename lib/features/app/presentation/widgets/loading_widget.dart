import 'package:flutter/cupertino.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';

import 'loading_indicator.dart';


class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key,this.size,this.backgroundColor}) : super(key: key);
final double? size;
  final Color? backgroundColor;


  @override
  Widget build(BuildContext context) {
    return  Center(
      child: LoadingIndicator(dimension: size,backgroundColor: backgroundColor),
    );
  }
}
