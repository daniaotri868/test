import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_customer/common/models/page_state/page_state.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';
import 'package:restaurant_customer/features/auth/presentation/pages/Register_page.dart';
import 'package:restaurant_customer/features/home/presentaion/bloc/home_bloc.dart';
import '../../../../generated/flutter_gen/assets.gen.dart';
import '../../../home/presentaion/widget/badge-widget.dart';
import '../../data/repositories/prefs_repository_impl.dart';
import '../widgets/app_image.dart';
import '../widgets/app_text.dart';

class BasePage extends StatefulWidget {
  final StatefulNavigationShell child;

  BasePage({Key? key, required this.child}) : super(key: key);

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  late HomeBloc bloc;
  late int? unReadNotificationCount;
  @override
  void initState() {
    super.initState();
    bloc = context.read<HomeBloc>();
    // unReadNotificationCount =
    //     bloc.state.getAllHomeData.getDataWhenSuccess!.unReadNotificationCount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // key: scaffoldKey,
        body: widget.child,
        bottomNavigationBar: BottomNavigationBar(
            elevation: 2,
            selectedItemColor: context.colorScheme.primary,
            currentIndex: widget.child.currentIndex,
            backgroundColor: context.colorScheme.onPrimary,
            showUnselectedLabels: true,
            unselectedItemColor: const Color(0xffADADAF),
            items: [
              // 1
              BottomNavigationBarItem(
                backgroundColor: context.colorScheme.onPrimary,
                icon: AppImage.asset(
                  Assets.icons.home,
                  color: const Color(0xffADADAF),
                  size: 55,
                ),
                label: '',
                activeIcon: AppImage.asset(
                  Assets.icons.home,
                  color: context.colorScheme.primary,
                  size: 55,
                ),
              ),
              // 2
              BottomNavigationBarItem(
                backgroundColor: context.colorScheme.onPrimary,
                icon: AppImage.asset(
                  Assets.icons.chif,
                  color: const Color(0xffADADAF),
                  size: 25,
                ),
                label: '',
                activeIcon: AppImage.asset(
                  Assets.icons.chif,
                  color: context.colorScheme.primary,
                  size: 25,
                ),
              ),
              // 3
              BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                    return BadgeWidget(
                        showBadge: (state.unReadNotificationCount ?? 0) != 0,
                        badgeContent: (state.unReadNotificationCount ?? 0) != 0
                            ? AppText.ratingNumber(
                                    "${state.unReadNotificationCount ?? 0}")
                                .copyWith(color: context.colorScheme.onPrimary)
                            : null,
                        child: AppImage.asset(Assets.icons.notification,
                            color: const Color(0xffADADAF), size: 30));
                  }),
                  label: '',
                  activeIcon: AppImage.asset(Assets.icons.notification,
                      color: context.colorScheme.primary, size: 31)),
              // 4
              BottomNavigationBarItem(
                backgroundColor: context.colorScheme.onPrimary,
                icon: AppImage.asset(
                  Assets.icons.user,
                  color: const Color(0xffADADAF),
                  size: 25,
                ),
                label: '',
                activeIcon: AppImage.asset(
                  Assets.icons.user,
                  color: context.colorScheme.primary,
                  size: 25,
                ),
              ),
            ],
            onTap: (index) async {
              final token = await StorageRepositoryImpl().token;
              if (token == null && (index == 1 || index == 2)) {
                context.go(RegisterPage.path);
              } else {
                widget.child.goBranch(index,
                    initialLocation: widget.child.currentIndex == index);
                if (index == 2) {
                  context.read<HomeBloc>().add(CancelNotificationNumberEvent());
                }
              }
            }));
  }

  static final scaffoldKey = GlobalKey<ScaffoldState>();
}
