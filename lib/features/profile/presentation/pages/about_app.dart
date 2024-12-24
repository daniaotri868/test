import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_customer/core/config/theme/app_theme.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';
import 'package:restaurant_customer/generated/assets.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../generated/l10n.dart';
import '../../../app/presentation/widgets/app_appbar.dart';
import '../../../app/presentation/widgets/app_image.dart';
import '../../../app/presentation/widgets/app_scaffold.dart';
import '../../../app/presentation/widgets/app_text.dart';
import '../widgets/contact_us.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  static String get name => "AboutApp";

  static String get path => "AboutApp";

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppAppBar(
        label: S.current.AboutApp,
        leading: InkWell(
            onTap: () => context.pop(context),
            child: Icon(
              Icons.arrow_back_ios,
              color: context.colorScheme.onSurface.withOpacity(.8),
            )),
      ),
      body: Padding(
        padding: REdgeInsetsDirectional.only(start: 30, end: 30, top: 7),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AppImage.asset(Assets.imagesProfileLogo),
              15.verticalSpace,
              AppText(S.current.TextAboutApplication),
              15.verticalSpace,

              // const ContactUs(icon: Assets.iconsWhatsappIcon,link: '+971-505-554-165',),
              GestureDetector(
                onTap: () {
                  print("shahed");
                  openWhatsAppChat();
                },
                child: const ContactUs(
                  icon: Assets.iconsWhatsappIcon,
                  link: '+963938882624',
                ),
              ),

              10.verticalSpace,
              GestureDetector(
                onTap: () {
                  openInstaPage();
                },
                child: const ContactUs(
                  icon: Assets.iconsInstagram,
                  link: '@FID-restaurant',
                ),
              ),
              //    const ContactUs(icon:Assets.iconsInstagram,link: '@FID-restaurant',),
              // 10.verticalSpace,
              // const ContactUs(icon: Assets.iconsFacebook,link: '@FID-restaurant',),
              // 10.verticalSpace,
              // const ContactUs(icon: Assets.iconsTelegram,link: '@FID-restaurant',),
            ],
          ),
        ),
      ),
    );
  }

  void openWhatsAppChat() async {
    try {
      var url = Uri.parse('https://wa.me/+963938882624');
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {}
    } catch (e) {}
  }

  void openInstaPage() async {
    var url = 'https://www.instagram.com/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
