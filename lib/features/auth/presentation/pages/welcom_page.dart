import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';
import 'package:restaurant_customer/features/app/presentation/widgets/app_button.dart';
import 'package:restaurant_customer/features/app/presentation/widgets/app_image.dart';
import 'package:restaurant_customer/features/app/presentation/widgets/app_scaffold.dart';
import 'package:restaurant_customer/features/app/presentation/widgets/app_text.dart';
import 'package:restaurant_customer/features/auth/presentation/pages/Register_page.dart';
import 'package:restaurant_customer/generated/l10n.dart';

import '../../../../generated/flutter_gen/assets.gen.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});
  static String get name => "/Wel1Page";
  static String get path => "/Wel1Page";

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final List<String> _images = [
    Assets.images.wel.path,
    Assets.images.wel2.path,
    Assets.images.wel3.path,
  ];

  int _currentImageIndex = 0;
  int _currentTextIndex = 0;

  void _nextIndex() {
    setState(() {
      if (_currentImageIndex == 2) {
        context.go(RegisterPage.path);
        return;
      }
      _currentImageIndex = (_currentImageIndex + 1) % _images.length;
      _currentTextIndex = (_currentTextIndex + 1) % 3;
    });
  }

  List<String> getTextList(BuildContext context) {
    return [
      S.of(context).Browse_and_order_all_products_at_any_time,
      S.of(context).Track_your_delivery_in_real_time,
      S.of(context).Track_your_order_until_it_reaches_you,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: AppImage.asset(
              Assets.svg.backgroundWel,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: REdgeInsets.only(left: 40, right: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppImage.asset(
                  _images[_currentImageIndex],
                  fit: BoxFit.contain,
                ),
                35.verticalSpace,
                SizedBox(
                  width: 200.w,
                  child: AppText(
                    getTextList(context)[_currentImageIndex],
                    style: context.textTheme.headlineSmall!.copyWith(),
                    color: context.colorScheme.onSurface,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
                40.verticalSpace,
                SizedBox(
                  width: 1.sw,
                  child: AppButton.dark(
                    title: S.of(context).next,
                    onPressed: _nextIndex,
                  ),
                ),
                SizedBox(
                  height: 100.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
