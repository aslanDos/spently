import 'package:flutter/material.dart';
import 'package:spently/core/constants/app_spacing.dart';
import 'package:spently/core/extensions/build_context_ext.dart';

class EmptyTransactions extends StatelessWidget {
  const EmptyTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.spacing32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.receipt_long_outlined,
              size: 64,
              color: context.textSecondary.withValues(alpha: 0.5),
            ),
            const SizedBox(height: AppSpacing.spacing16),
            Text(
              'No transactions yet',
              style: context.textTheme.titleMedium?.copyWith(
                color: context.textSecondary,
              ),
            ),
            const SizedBox(height: AppSpacing.spacing8),
            Text(
              'Tap + to add your first transaction',
              style: context.textTheme.bodySmall?.copyWith(
                color: context.textSecondary.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
