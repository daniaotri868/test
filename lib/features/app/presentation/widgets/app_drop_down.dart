import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_customer/app.dart';
import 'package:restaurant_customer/core/config/theme/app_theme.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';
import 'package:restaurant_customer/core/config/theme/extension_color_scheme.dart';

import 'app_image.dart';
import 'app_text.dart';

class AppDropDown<T> extends StatefulWidget {
  final String? title;
  final String? name;
  final bool enabled;
  final bool isLoading;
  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? constraints;

  final bool isFailure;
  final T? initialValue;
  final String? hintText;
  final List<DropdownMenuItem<T>>? items;
  final VoidCallback? onRetry;
  final void Function(T?)? onChanged;
  final EdgeInsetsGeometry? margin;
  final double elevation;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final bool isExpanded;
  final double? height;
  final Widget? child;
  final ButtonStyleData? buttonStyleData;
  final BoxBorder? border;
  final bool filled;
  final Color? fillColor;
  final String? Function(T?)? validator;

  final void Function(bool)? onMenuStateChange;

  const AppDropDown({
    super.key,
    this.fillColor,
    this.filled = true,
    this.isExpanded = true,
    this.enabledBorder,
    this.focusedBorder,
    this.onMenuStateChange,
    this.title,
    required this.items,
    this.onRetry,
    this.enabled = true,
    this.isLoading = false,
    this.isFailure = false,
    this.elevation = 2,
    this.validator,
    this.name,
    this.initialValue,
    this.hintText,
    this.onChanged,
    this.prefixIconConstraints,
    this.constraints,
    this.margin,
    this.height,
    this.child,
    this.buttonStyleData,
    this.border,
  });

  @override
  State<AppDropDown<T>> createState() => _AppDropDownState<T>();
}

class _AppDropDownState<T> extends State<AppDropDown<T>> {
  T? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margin ?? EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null) AppText.bodyMedium(widget.title!),
          if (widget.title != null) 12.verticalSpace,
          DropdownButtonHideUnderline(
            child: DropdownButtonFormField2<T>(
              validator: widget.validator,
              isExpanded: widget.isExpanded,
              items: widget.isLoading || widget.isFailure ? [] : widget.items!,
              hint: AppText.bodyLight(widget.hintText ?? ""),
              onChanged: (value) {
                setState(() => _selectedValue = value);
                widget.onChanged?.call(value);
              },
              decoration: InputDecoration(
                constraints:
                    widget.constraints ?? BoxConstraints(minHeight: 48.h),
                prefixIconConstraints: widget.prefixIconConstraints ??
                    BoxConstraints(
                        maxHeight: 40.h, minHeight: 10.h, minWidth: 40.w),
                suffixIconConstraints: BoxConstraints(
                    maxHeight: 40.h, minHeight: 10.h, minWidth: 40.w),
                filled: true,
                fillColor:
                    widget.fillColor ?? context.colorScheme.onSurfaceVariant,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: context.colorScheme.systemGray.shade200),
                  borderRadius: BorderRadius.circular(68),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: context.colorScheme.systemGray.shade200),
                  borderRadius: BorderRadius.circular(68),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: context.colorScheme.error),
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: widget.enabledBorder ??
                    OutlineInputBorder(
                      borderSide: BorderSide(
                          color: context.colorScheme.onSurfaceVariant),
                      borderRadius: BorderRadius.circular(68),
                    ),
                focusedBorder: widget.focusedBorder ??
                    OutlineInputBorder(
                      borderSide: BorderSide(
                          color: context.colorScheme.onSurfaceVariant),
                      borderRadius: BorderRadius.circular(68),
                    ),
              ),
              onMenuStateChange: widget.onMenuStateChange,
              value: _selectedValue ?? widget.initialValue,
              style: context.textTheme.label.light
                  .copyWith(color: context.colorScheme.shadow),
              dropdownStyleData: DropdownStyleData(
                offset: const Offset(0, 0),
                elevation: 1,
                //! if you change, pass height
                maxHeight: 170.h,
                padding: REdgeInsets.only(top: 10),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(25)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
