import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spently/core/constants/app_colors.dart';
import 'package:spently/core/constants/app_icon_sizes.dart';
import 'package:spently/core/constants/app_radius.dart';
import 'package:spently/core/constants/app_sizes.dart';
import 'package:spently/core/constants/app_spacing.dart';
import 'package:spently/core/constants/app_text_styles.dart';
import 'package:spently/core/extensions/build_context_ext.dart';
import 'package:spently/core/shared/icons/app_icons.dart';
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
    final accountColor = account.backgroundColor;

    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.spacing12,
        vertical: AppSpacing.spacing8,
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.secondary.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(AppRadius.radius24),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon with circle background
          Container(
            padding: const EdgeInsets.all(AppSpacing.spacing8),
            decoration: BoxDecoration(
              color: accountColor.withValues(alpha: 0.5),
              shape: BoxShape.circle,
            ),
            child: Icon(
              account.iconType.icon,
              size: AppIconSizes.small,
              color: accountColor,
            ),
          ),

          const SizedBox(width: AppSpacing.spacing12),

          // Name + balance
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Account name
              Text(
                account.name,
                style: const TextStyle(
                  fontSize: AppSizes.medium,
                  fontWeight: AppFontWeight.bold,
                ),
              ),

              // Account balance
              Text(
                '${account.balance} ${account.currency.symbol}',
                style: TextStyle(
                  fontSize: AppSizes.small,
                  fontWeight: AppFontWeight.medium,
                  color: context.textSecondary,
                ),
              ),
            ],
          ),

          const SizedBox(width: AppSpacing.spacing12),

          // Chevron Down
          const Icon(AppIcons.chevronBottom, size: AppIconSizes.small),
        ],
      ),
    );
  }
}
