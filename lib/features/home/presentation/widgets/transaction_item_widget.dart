import 'package:flutter/material.dart';
import 'package:spently/core/constants/app_colors.dart';
import 'package:spently/core/constants/app_radius.dart';
import 'package:spently/core/constants/app_spacing.dart';
import 'package:spently/core/extensions/build_context_ext.dart';
import 'package:spently/core/shared/enums/transaction_type/app_transaction_type.dart';
import 'package:spently/core/shared/mappers/app_icon_mapper.dart';
import 'package:spently/features/category/domain/entities/category_entity.dart';
import 'package:spently/features/transaction/domain/entities/transaction_entity.dart';

class TransactionItem extends StatelessWidget {
  final TransactionEntity transaction;
  final CategoryEntity? category;
  final VoidCallback? onTap;

  const TransactionItem({
    super.key,
    required this.transaction,
    this.category,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isIncome = transaction.type == TransactionType.income;
    final amountColor = isIncome ? AppColors.success : AppColors.error;
    final amountPrefix = isIncome ? '+' : '-';

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.spacing16,
          vertical: AppSpacing.spacing12,
        ),
        decoration: BoxDecoration(
          color: context.surface,
          borderRadius: BorderRadius.circular(AppRadius.radius16),
          border: Border.all(color: context.border),
        ),
        child: Row(
          children: [
            // Category Icon
            _buildCategoryIcon(context),
            const SizedBox(width: AppSpacing.spacing12),

            // Category name and note
            Expanded(child: _buildTransactionInfo(context)),

            // Amount
            _buildAmount(context, amountColor, amountPrefix),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryIcon(BuildContext context) {
    final categoryColor = category?.backgroundColor ?? Colors.grey;

    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: categoryColor.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(AppRadius.radius12),
      ),
      child: Center(
        child: Icon(
          category?.iconType.icon ?? Icons.category,
          size: 20,
          color: categoryColor,
        ),
      ),
    );
  }

  Widget _buildTransactionInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          category?.name ?? 'Unknown',
          style: context.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        if (transaction.note != null && transaction.note!.isNotEmpty)
          Text(
            transaction.note!,
            style: context.textTheme.bodySmall?.copyWith(
              color: context.textSecondary,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
      ],
    );
  }

  Widget _buildAmount(BuildContext context, Color amountColor, String prefix) {
    return Text(
      '$prefix${transaction.amount.toStringAsFixed(0)}',
      style: context.textTheme.bodyLarge?.copyWith(
        fontWeight: FontWeight.w700,
        color: amountColor,
      ),
    );
  }
}
