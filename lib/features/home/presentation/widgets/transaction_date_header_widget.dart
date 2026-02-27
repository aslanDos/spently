import 'package:flutter/material.dart';
import 'package:spently/core/constants/app_spacing.dart';
import 'package:spently/core/extensions/build_context_ext.dart';
import 'package:spently/core/utils/date_formatter.dart';

class TransactionDateHeader extends StatelessWidget {
  final DateTime date;

  const TransactionDateHeader({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.spacing4,
        vertical: AppSpacing.spacing8,
      ),
      child: Text(
        DateFormatter.formatRelative(date),
        style: context.textTheme.titleSmall?.copyWith(
          fontWeight: FontWeight.w600,
          color: context.textSecondary,
        ),
      ),
    );
  }
}
