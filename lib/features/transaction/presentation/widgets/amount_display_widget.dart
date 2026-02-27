import 'package:flutter/cupertino.dart';
import 'package:spently/core/constants/app_colors.dart';
import 'package:spently/core/constants/app_text_styles.dart';
import 'package:spently/core/shared/enums/transaction_type/app_transaction_type.dart';
import 'package:spently/core/shared/mappers/app_currency_mapper.dart';

class AmountDisplay extends StatelessWidget {
  final String amount;
  final TransactionType transactionType;

  const AmountDisplay({
    super.key,
    required this.amount,
    required this.transactionType,
  });

  Color get _amountColor {
    switch (transactionType) {
      case TransactionType.income:
        return AppColors.success;
      case TransactionType.expense:
        return AppColors.error;
      case TransactionType.transfer:
        return AppColors.gray;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            amount,
            style: TextStyle(
              fontSize: 44,
              fontWeight: AppFontWeight.black,
              letterSpacing: 0.4,
              color: _amountColor,
            ),
          ),
          SizedBox(width: 10),
          Text(
            'KZT'.symbol,
            style: TextStyle(
              fontSize: 36,
              fontWeight: AppFontWeight.black,
              letterSpacing: 0.4,
              color: _amountColor,
            ),
          ),
        ],
      ),
    );
  }
}
