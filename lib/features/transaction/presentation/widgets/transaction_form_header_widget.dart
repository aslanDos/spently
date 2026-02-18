import 'package:flutter/cupertino.dart';
import 'package:spently/core/shared/enums/transaction_type/app_transaction_type.dart';
import 'package:spently/core/shared/icons/app_icons.dart';
import 'package:spently/core/shared/widgets/header_action_button_widget.dart';
import 'package:spently/core/shared/widgets/type_toggle_widget.dart';

Widget buildTransactionFormHeader({
  required ValueChanged<TransactionType> onTypeChange,
  required VoidCallback onClose,
  required TransactionType selectedType,
  required BuildContext context,
}) {
  return Padding(
    padding: EdgeInsetsGeometry.symmetric(vertical: 24),
    child: SizedBox(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Close button
          Align(
            alignment: Alignment.centerLeft,
            child: HeaderActionButton(
              icon: Icon(AppIcons.close(context), size: 18),
              onTap: onClose,
            ),
          ),

          // Transaction Type Toggle
          Align(
            alignment: Alignment.center,
            child: TypeToggle(
              selected: selectedType,
              items: TransactionType.values,
              onChanged: onTypeChange,
            ),
          ),

          // Delete button (if delete mode)
        ],
      ),
    ),
  );
}
