import 'package:flutter/cupertino.dart';
import 'package:spently/core/constants/app_text_styles.dart';
import 'package:spently/core/shared/mappers/app_currency_mapper.dart';

class AmountDisplay extends StatelessWidget {
  final String amount;

  const AmountDisplay({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(amount, style: AppTextStyle.headlineLarge),
        SizedBox(width: 10),
        Text('KZT'.symbol, style: AppTextStyle.headlineMedium),
      ],
    );
  }
}
