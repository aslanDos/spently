import 'package:flutter/material.dart';
import 'package:spently/core/constants/app_text_styles.dart';
import 'package:spently/core/shared/icons/app_icons.dart';
import 'package:spently/core/shared/mappers/app_currency_mapper.dart';
import 'package:spently/core/shared/mappers/app_icon_mapper.dart';
import 'package:spently/features/account/domain/entities/account_entity.dart';

import 'package:spently/core/constants/app_radius.dart';
import 'package:spently/core/extensions/build_context_ext.dart';

class AccountCard extends StatelessWidget {
  final AccountEntity account;
  final VoidCallback onTap;
  final VoidCallback? onEdit;
  final bool shuffleMode;

  const AccountCard({
    super.key,
    required this.account,
    required this.onTap,
    this.onEdit,
    required this.shuffleMode,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(AppRadius.radius24),
      onTap: onTap,
      child: Container(
        height: 90,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 4),
        decoration: BoxDecoration(
          color: context.colorScheme.secondary.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(AppRadius.radius12),
        ),
        child: Row(
          children: [
            // Icon Circle
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: account.backgroundColor.withValues(alpha: 0.5),
              ),
              child: Center(
                child: Icon(
                  account.iconType.icon,
                  color: account.backgroundColor,
                  size: 20,
                ),
              ),
            ),

            const SizedBox(width: 12),

            // Name + Balance
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${account.name} (${account.currency.symbol})',
                        style: TextStyle(fontSize: 16, color: context.primary),
                      ),
                      GestureDetector(
                        onTap: onEdit,
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 200),
                          child: shuffleMode
                              ? Icon(AppIcons.gripVertical, size: 16)
                              : Icon(AppIcons.pencil, size: 16),
                        ),
                      ),
                    ],
                  ),
                  Divider(height: 10),
                  Text(
                    '${account.balance} ${account.currency.symbol}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: AppFontWeight.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
