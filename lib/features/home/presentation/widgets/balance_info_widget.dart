import 'package:flutter/cupertino.dart';
import 'package:spently/core/constants/app_colors.dart';
import 'package:spently/core/constants/app_radius.dart';
import 'package:spently/core/constants/app_sizes.dart';
import 'package:spently/core/constants/app_text_styles.dart';
import 'package:spently/core/extensions/build_context_ext.dart';

class BalanceInfo extends StatelessWidget {
  const BalanceInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Period picker
          _buildBalancePeriod(context),
          // Amount
          _buildAmount(),
          // Income and expense info
          _buildSpendingsAmount(),
        ],
      ),
    );
  }

  Widget _buildSpendingsAmount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSpendingInfo(isIncome: true),
        SizedBox(width: 20),
        _buildSpendingInfo(isIncome: false),
      ],
    );
  }

  Widget _buildSpendingInfo({required bool isIncome}) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: isIncome
                ? AppColors.success.withValues(alpha: 0.4)
                : AppColors.error.withValues(alpha: 0.4),
            borderRadius: BorderRadius.circular(AppRadius.radius24),
          ),
          child: Icon(
            isIncome
                ? CupertinoIcons.arrow_down_left
                : CupertinoIcons.arrow_up_right,
            size: 16,
            color: isIncome
                ? const Color.fromARGB(255, 1, 174, 61)
                : const Color.fromARGB(255, 205, 3, 3),
          ),
        ),
        SizedBox(width: 4),
        Text('0 ₸', style: AppTextStyle.labelLarge),
      ],
    );
  }

  Widget _buildAmount() => Text('- 1 600 ₸', style: AppTextStyle.headlineLarge);

  Widget _buildBalancePeriod(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Баланс за', style: AppTextStyle.labelMedium),
        SizedBox(width: 10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: context.border,
            borderRadius: BorderRadius.circular(AppRadius.radius24),
          ),
          child: Row(
            children: [
              // Calendar Icon
              Icon(CupertinoIcons.calendar, size: 18),
              SizedBox(width: 4),
              // Date title
              Text('Этот месяц', style: AppTextStyle.labelMedium),
            ],
          ),
        ),
      ],
    );
  }
}
