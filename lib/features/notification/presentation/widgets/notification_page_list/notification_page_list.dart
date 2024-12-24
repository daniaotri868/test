import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';
import '../../../data/models/all_notification_model.dart';
import '../../../domain/usecases/get_all_notification_usecase.dart';
import '../../bloc/notification_bloc.dart';
import 'notification_page_item.dart';

class NotificationPageList extends StatefulWidget {
  const NotificationPageList({super.key});
  @override
  State<NotificationPageList> createState() => _NotificationPageListState();
}

class _NotificationPageListState extends State<NotificationPageList> {
  late NotificationBloc bloc;

  @override
  void initState() {
    bloc = context.read<NotificationBloc>();
    bloc.state.pagingController.addPageRequestListener((pageKey) {
      bloc.add(GetAllNotificationEvent(
          params: AllNotificationsParams(pageNumber: pageKey)));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: BlocSelector<NotificationBloc, NotificationState,
                List<NotificationData>?>(
            selector: (state) => state.pagingController.itemList,
            builder: (context, pagingController) {
              return PagedListView.separated(
                  pagingController:
                      context.read<NotificationBloc>().state.pagingController,
                  builderDelegate: PagedChildBuilderDelegate<NotificationData>(
                      itemBuilder: (context, item, index) =>
                          NotificationPageItem(
                              notification: item, index: index),
                      newPageProgressIndicatorBuilder: (context) => Center(
                          child: Padding(
                              padding: EdgeInsets.all(10.r),
                              child: CircularProgressIndicator(
                                  strokeWidth: 5,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      context.colorScheme.errorContainer)))),
                      firstPageProgressIndicatorBuilder: (context) => Center(
                          child: CircularProgressIndicator(
                              strokeWidth: 5,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  context.colorScheme.errorContainer)))),
                  separatorBuilder: (context, index) => 12.verticalSpace);
            }));
  }
}
