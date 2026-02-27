import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spently/core/constants/app_text_styles.dart';
import 'package:spently/core/shared/enums/transaction_type/app_transaction_type.dart';
import 'package:spently/core/shared/icons/app_icons.dart';

class TypeToggle extends StatelessWidget {
  final TransactionType selected;
  final List<TransactionType> items;
  final ValueChanged<TransactionType> onChanged;

  const TypeToggle({
    super.key,
    required this.selected,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: items.map((type) {
          final isSelected = selected == type;

          return GestureDetector(
            onTap: () => onChanged(type),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected ? Colors.orange.shade100 : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Icon(_iconForType(type, context), size: 14),
                  if (isSelected) ...[
                    const SizedBox(width: 6),
                    Text(_labelForType(type), style: AppTextStyle.bodySmall),
                  ],
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  IconData _iconForType(TransactionType type, BuildContext context) {
    switch (type) {
      case TransactionType.income:
        return AppIcons.arrowUpleft;
      case TransactionType.expense:
        return AppIcons.arrowDownRight;
      case TransactionType.transfer:
        return AppIcons.arrowUpDown;
    }
  }

  String _labelForType(TransactionType type) {
    switch (type) {
      case TransactionType.income:
        return 'Доход';
      case TransactionType.expense:
        return 'Расход';
      case TransactionType.transfer:
        return 'Перевод';
    }
  }
}
