import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';
import 'package:restaurant_customer/features/app/presentation/widgets/app_button.dart';

import '../../../app/presentation/widgets/app_text.dart';

class DialogLocation extends StatefulWidget {
  final String title;
  final void Function()? onPressCancel;
  final void Function()? onPressAccept;

  @override
  State<DialogLocation> createState() => _DialogLocationState();

  const DialogLocation(
      {super.key,
      required this.onPressAccept,
      required this.onPressCancel,
      required this.title});
}

class _DialogLocationState extends State<DialogLocation> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(13),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: context.colorScheme.onPrimary,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          5.verticalSpace,
          AppText(
            style: context.textTheme.bodyMedium!.copyWith(
              color: context.colorScheme.primary,
            ),
            widget.title,
          ),
          10.verticalSpace,
          Padding(
            padding: REdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                  onPressed: widget.onPressCancel,
                  style: ElevatedButton.styleFrom(
                      foregroundColor: context.colorScheme.onPrimary,
                      backgroundColor: context.colorScheme.error),
                  child: const Text('إلغاء'),
                )),
                5.horizontalSpace,
                Expanded(
                    child: AppButton.dark(
                  onPressed: widget.onPressAccept,
                  title: 'تأكيد',
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
