import 'package:flutter/material.dart';
import 'package:spently/core/constants/app_colors.dart';
import 'package:spently/core/constants/app_sizes.dart';
import 'package:spently/core/constants/app_text_styles.dart';
import 'package:spently/core/shared/mappers/app_currency_mapper.dart';
import 'package:spently/core/shared/mappers/app_icon_mapper.dart';
import 'package:spently/features/account/domain/entities/account_entity.dart';

class AccountCapsule extends StatelessWidget {
  final AccountEntity? selectedAccount;
  final ValueChanged<AccountEntity> onAccountSelected;
  final String? editingAccountId;

  const AccountCapsule({
    super.key,
    required this.selectedAccount,
    required this.onAccountSelected,
    this.editingAccountId,
  });

  @override
  Widget build(BuildContext context) {
    if (selectedAccount == null) {
      return const SizedBox.shrink();
    }

    final account = selectedAccount!;

    return Container(
      padding: EdgeInsets.only(left: 4, top: 2, right: 20, bottom: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.radiusTwoXLarge),
        border: Border.all(color: context.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: AppColors.error,
            child: Icon(
              AppIconMapper.fromString(account.icon.toString()).icon(context),
            ),
          ),
          SizedBox(width: 8),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Account name
              Text(account.name, style: AppTextStyle.labelMedium),

              // Account balance
              Text(
                '${account.balance} ${account.currency.symbol}',
                style: AppTextStyle.labelSmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
