import 'package:flutter/material.dart';
import 'package:spently/core/shared/icons/app_icons.dart';

class TypeToggle extends StatelessWidget {
  final bool isExpense;
  final ValueChanged<bool> onChanged;

  const TypeToggle({
    super.key,
    required this.isExpense,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildSegmentButton(context: context, type: 'Income'),
          _buildSegmentButton(context: context, type: 'Expense'),
        ],
      ),
    );
  }

  Widget _buildSegmentButton({
    required BuildContext context,
    required String type,
  }) {
    final selected = isExpense == (type == 'Expense');

    return GestureDetector(
      onTap: () => onChanged(type == 'Expense' ? true : false),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: selected ? Colors.orange.shade100 : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Icon(
            type == 'Expense'
                ? AppIcons.arrowDownRight(context)
                : AppIcons.arrowUpleft(context),
            size: 18,
          ),
        ),
      ),
    );
  }
}

// Widget buildTypeToggle({required bool isExpense}) {
//   return Container(
//     margin: const EdgeInsets.symmetric(horizontal: 60),
//     decoration: BoxDecoration(
//       color: Colors.grey.shade200,
//       borderRadius: BorderRadius.circular(AppSizes.radiusFull),
//     ),
//     child: Row(
//       children: [
//         _buildSegmentButton(!isExpense),
//         _buildSegmentButton(isExpense),
//       ],
//     ),
//   );
// }

// Widget _buildSegmentButton({required bool isExpense}) {}
