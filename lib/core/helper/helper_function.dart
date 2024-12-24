import 'dart:convert';
import 'dart:io';

import 'package:advertising_id/advertising_id.dart';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:restaurant_customer/features/app/domain/repositories/prefs_repository.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../common/models/page_state/bloc_status.dart';
import '../../common/models/page_state/page_state.dart';
import '../../features/app/data/models/pagination_model.dart';
import '../../services/service_locator.dart';

class HelperFunctions {

  static PageState<T> mapEitherToPageState<T>({
    required Either<dynamic, T> either,
    VoidCallback? onFailure,
    Function(T data)? onSuccess,
    bool Function(T data)? emptyChecker,
  }) {
    return either.fold(
          (error) {
        onFailure?.call();

        return PageState.error(exception: error, message: error.message);
      },
          (success) {
        onSuccess?.call(success);

        bool? isEmpty = emptyChecker?.call(success);
        if (isEmpty == true) {
          return const PageState.empty();
        }

        return PageState.loaded(data: success);
      },
    );
  }
  static PagingController<int ,T> pageNationEitherStatus<T>({
    required Either<dynamic, PaginationModel<T>> either,
    PagingController<int, T>? pagingController,
    required int pageKey
  }) {

    return either.fold(
          (error) {
            pagingController?.error=error;
             return pagingController!;
      },
          (PaginationModel<T> success) {
            final isLastPage = (success.pageNumber)! + 1 >= (success.totalPages!);
            if (isLastPage) {
              pagingController?.appendLastPage(success.data??[]);
               return pagingController!;
            }
            final nextPageKey = pageKey+ 1;
            pagingController?.appendPage(success.data??[], nextPageKey);
            return pagingController!;

      },
    );
  }

  static BlocStatus mapEitherToBlocStatus({
    required Either<dynamic, void> either,
    VoidCallback? onFailure,
    Function()? onSuccess,
  }) {
    return either.fold(
          (error) {
        onFailure?.call();
        return BlocStatus.fail(error: error.message);
      },
          (success) {
        onSuccess?.call();
        return const BlocStatus.success();
      },
    );
  }



  static Future<String?> getDeviceId() async {
    try {
      final status = await AppTrackingTransparency.requestTrackingAuthorization();
      if(Platform.isIOS && status != TrackingStatus.authorized){
        DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        print("${iosInfo.identifierForVendor} deviceId+++++++++++++++++++++++++++++++++++++++++++");
        return iosInfo.identifierForVendor;
      }
      String? deviceId = await AdvertisingId.id(true);
      print("${deviceId} deviceId+++++++++++++++++++++++++++++++++++++++++++");
      return deviceId;
    } on PlatformException {
      print("unknown deviceId+++++++++++++++++++++++++++++++++++++++++++");
      return "unknown";
    }
  }
  static String formatDateTimeToLocal(DateTime dateTime) {
    // Format the DateTime object using the DateFormat class from the intl package
    String formattedDateTime =
    DateFormat('h:mm a, d/M/yyyy').format(dateTime.toLocal());

    // print(formattedDateTime); // Output: "May 25, 2023, 2:30:00 PM"
    return formattedDateTime;
  }

  static double timeToDouble(TimeOfDay myTime) =>
      myTime.hour + myTime.minute / 60.0;

  static Future<void> handleUserNavigation(
      {required BuildContext context,
        required VoidCallback completeLoading}) async {
    if (await getIt<StorageRepository>().hastToken()) {
    } else {
    }
  }



  static TimeOfDay convertStringToTimeOfDatWorkSchedule(String s) {
    final dateTime = DateTime.parse(s);
    return TimeOfDay(hour: dateTime?.hour ?? 0, minute: dateTime?.minute ?? 0);
  }

  static String formatPrice(num number) {
    NumberFormat formatter = NumberFormat.currency(
        locale: 'ar', customPattern: ',###,###', decimalDigits: 0);
    String formattedNumber = formatter.format(number);
    return formattedNumber;
  }

  static String formatDate(DateTime date) =>
      DateFormat.MMMMEEEEd().format(date);

  static String timeOfDayStringToString(TimeOfDay time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }

  static double toDouble(TimeOfDay myTime) =>
      myTime.hour + myTime.minute / 60.0;

  static double calculateDeliveryTime(String time) {
    TimeOfDay time0 = TimeOfDay(
        hour: int.parse(time.split(":")[0]),
        minute: int.parse(time.split(":")[1]));
    TimeOfDay timeOfDay = TimeOfDay.now();
    return (toDouble(time0) - toDouble(timeOfDay)) < 0
        ? 0
        : (toDouble(time0) - toDouble(timeOfDay));
  }



  static Future<bool> urlLauncherApplication(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      return await launchUrl(
        uri,
        mode: Platform.isAndroid
            ? LaunchMode.externalNonBrowserApplication
            : LaunchMode.externalApplication,
        webViewConfiguration: const WebViewConfiguration(
            enableDomStorage: false, enableJavaScript: false),
      );
    } else {
      throw Exception('Unable to launch url');
    }
  }

  static String getCurlCommandFromRequest(RequestOptions requestOptions) {
    var curlCmd = "curl";
    curlCmd += " -X ${requestOptions.method}";
    curlCmd += " \"${requestOptions.baseUrl}${requestOptions.uri.path}\"";

    // Adding headers to the command
    requestOptions.headers.forEach((key, value) {
      curlCmd += " -H \"$key: $value\"";
    });

    // Adding requestOptions body to the command for non-multipart requests
    if (requestOptions.data != null) {
      curlCmd += " -d '${json.encode(requestOptions.data)}'";
    }

    return curlCmd;
  }



  /// Cast to [T] if possible or return null
  static T? castOrNull<T>(x) => x is T ? x : null;

  static String timeToString(TimeOfDay time) =>
      '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';

  static TimeOfDay stringToTime(String time) => TimeOfDay(
      hour: int.parse(time.substring(0, 2)),
      minute: int.parse(time.substring(3, 5)));

  static List<T> fromJsonList<T>(
      List data, T Function(Map<String, dynamic> map) fromJson) =>
      data.map((e) => fromJson((e as Map).cast())).toList();

  static flutterToast(String text, Color colorMessage) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 7,
        backgroundColor: colorMessage,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}


