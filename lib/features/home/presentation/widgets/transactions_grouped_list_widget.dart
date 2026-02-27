import 'package:flutter/material.dart';
import 'package:spently/core/constants/app_spacing.dart';
import 'package:spently/features/category/domain/entities/category_entity.dart';
import 'package:spently/features/home/presentation/widgets/transaction_date_header_widget.dart';
import 'package:spently/features/home/presentation/widgets/transaction_item_widget.dart';
import 'package:spently/features/transaction/domain/entities/transaction_entity.dart';

class TransactionsGroupedList extends StatelessWidget {
  final List<TransactionEntity> transactions;
  final List<CategoryEntity> categories;
  final void Function(TransactionEntity)? onTransactionTap;

  const TransactionsGroupedList({
    super.key,
    required this.transactions,
    required this.categories,
    this.onTransactionTap,
  });

  @override
  Widget build(BuildContext context) {
    if (transactions.isEmpty) {
      return const SizedBox.shrink();
    }

    final grouped = _groupTransactionsByDate(transactions);
    final sortedDates = grouped.keys.toList()
      ..sort((a, b) => b.compareTo(a)); // Most recent first

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spacing16),
      itemCount: sortedDates.length,
      itemBuilder: (context, index) {
        final date = sortedDates[index];
        final dateTransactions = grouped[date]!;

        return _buildDateGroup(context, date, dateTransactions);
      },
    );
  }

  Widget _buildDateGroup(
    BuildContext context,
    DateTime date,
    List<TransactionEntity> dateTransactions,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TransactionDateHeader(date: date),
        ...dateTransactions.map((transaction) {
          final category = _findCategory(transaction.categoryId);
          return Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.spacing8),
            child: TransactionItem(
              transaction: transaction,
              category: category,
              onTap: onTransactionTap != null
                  ? () => onTransactionTap!(transaction)
                  : null,
            ),
          );
        }),
        const SizedBox(height: AppSpacing.spacing8),
      ],
    );
  }

  Map<DateTime, List<TransactionEntity>> _groupTransactionsByDate(
    List<TransactionEntity> transactions,
  ) {
    final Map<DateTime, List<TransactionEntity>> grouped = {};

    for (final transaction in transactions) {
      final dateKey = DateTime(
        transaction.date.year,
        transaction.date.month,
        transaction.date.day,
      );

      if (grouped.containsKey(dateKey)) {
        grouped[dateKey]!.add(transaction);
      } else {
        grouped[dateKey] = [transaction];
      }
    }

    // Sort transactions within each group by date descending
    for (final key in grouped.keys) {
      grouped[key]!.sort((a, b) => b.date.compareTo(a.date));
    }

    return grouped;
  }

  CategoryEntity? _findCategory(String categoryId) {
    try {
      return categories.firstWhere((c) => c.id == categoryId);
    } catch (_) {
      return null;
    }
  }
}
