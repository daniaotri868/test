import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';
import 'package:restaurant_customer/core/config/theme/extension_color_scheme.dart';
import 'package:restaurant_customer/features/notification/presentation/bloc/notification_bloc.dart';
import '../../../../../generated/flutter_gen/assets.gen.dart';
import '../../../../../services/navigation/router.dart';
import '../../../../app/presentation/widgets/app_image.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../../../../order/presentation/pages/order_details_page.dart';
import '../../../../profile/presentation/pages/my_coupon.dart';
import '../../../data/models/all_notification_model.dart';

class NotificationPageItem extends StatelessWidget {
  final NotificationData notification;
  final int index;
  const NotificationPageItem({
    Key? key,
    required this.notification,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          context.read<NotificationBloc>().add(ChangeStatusNotificationEvent(
              notification: notification, index: index));
          bool isOrtder = notification.title == 'You have a new order';
          String root = isOrtder ? OrderDetailsPage.name : MyCoupon.name;
          context.goNamed(root, extra: notification.orderId);
        },
        child: Container(
            height: 85.h,
            alignment: Alignment.center,
            padding: EdgeInsetsDirectional.only(
                start: 5.w, end: 12.w, top: 4.5.h, bottom: 4.5.h),
            margin: EdgeInsetsDirectional.only(start: 30.w, end: 12.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: !notification.isRead
                    ? Border.all(color: context.colorScheme.primary)
                    : null,
                color: context.colorScheme.onTertiary,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      spreadRadius: 0,
                      blurRadius: 12,
                      offset: const Offset(0, 2))
                ]),
            child: Stack(children: [
              Row(children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(4.r),
                    child: AppImage.asset(Assets.images.filterNotification.path,
                        fit: BoxFit.cover, height: 76.h, width: 76.w)),
                7.horizontalSpace,
                Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText.paragraphRegular(notification.title,
                                color: context.colorScheme.notificationTitle),
                            AppText.ratingNumber(
                                DateFormat('yyyy-MM-dd')
                                    .format(notification.createdAt),
                                fontWeight: FontWeight.w500,
                                color: context.colorScheme.notificationDate)
                          ]),
                      AppText.paragraphRegular(notification.body,
                          color: context.colorScheme.notificationTitle)
                    ]))
              ]),
              Container(
                  width: 11.w,
                  height: 11.h,
                  margin: EdgeInsetsDirectional.only(start: 3.w, top: 2.5.h),
                  decoration: !notification.isRead
                      ? BoxDecoration(
                          borderRadius: BorderRadius.circular(30.r),
                          color: context.colorScheme.primary)
                      : null)
            ])));
  }
}
