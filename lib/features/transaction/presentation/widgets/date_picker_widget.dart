import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:spently/core/constants/app_icon_sizes.dart';
import 'package:spently/core/constants/app_radius.dart';
import 'package:spently/core/constants/app_spacing.dart';
import 'package:spently/core/extensions/build_context_ext.dart';
import 'package:spently/core/shared/icons/app_icons.dart';
import 'package:spently/core/utils/date_formatter.dart';

class DatePicker extends StatefulWidget {
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateChanged;

  const DatePicker({
    super.key,
    required this.selectedDate,
    required this.onDateChanged,
  });

  @override
  State<DatePicker> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePicker> {
  bool get _isIOS => Platform.isIOS;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickDate,
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.spacing12,
          vertical: AppSpacing.spacing8,
        ),
        decoration: BoxDecoration(
          color: context.colorScheme.secondary.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(AppRadius.radius24),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              AppIcons.calendar,
              size: AppIconSizes.medium,
              color: context.primary,
            ),
            const SizedBox(width: AppSpacing.spacing8),
            Text(DateFormatter.formatRelative(widget.selectedDate)),
          ],
        ),
      ),
    );
  }

  void _pickDate() {
    if (_isIOS) {
      _showCupertinoDatePicker();
    } else {
      _showMaterialDatePicker();
    }
  }

  void _showCupertinoDatePicker() {
    DateTime tempDate = widget.selectedDate;

    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          padding: const EdgeInsets.only(top: 6),
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          color: CupertinoColors.systemBackground.resolveFrom(context),
          child: SafeArea(
            top: false,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CupertinoButton(
                      child: const Text('Cancel'),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    CupertinoButton(
                      child: const Text('Done'),
                      onPressed: () {
                        widget.onDateChanged(tempDate);
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
                Expanded(
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime: widget.selectedDate,
                    minimumDate: DateTime(2020),
                    maximumDate: DateTime.now(),
                    onDateTimeChanged: (DateTime newDate) {
                      setState(() => tempDate = newDate);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showMaterialDatePicker() {}
}
