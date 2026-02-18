import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:spently/core/constants/app_colors.dart';
import 'package:spently/core/constants/app_sizes.dart';

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
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 9),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.radiusTwoXLarge),
          border: Border.all(color: context.border),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(CupertinoIcons.calendar, size: 24),
            SizedBox(width: 6),
            Text(_formatSelectedDate()),
          ],
        ),
      ),
    );
  }

  String _formatSelectedDate() {
    final now = DateTime.now();

    if (_isSameDay(widget.selectedDate, now)) {
      return 'Today';
    }

    final yesterday = now.subtract(const Duration(days: 1));
    if (_isSameDay(widget.selectedDate, yesterday)) {
      return 'Yesterday';
    }

    return "${widget.selectedDate.day}.${widget.selectedDate.month}.${widget.selectedDate.year}";
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
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
