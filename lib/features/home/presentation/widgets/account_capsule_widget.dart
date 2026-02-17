import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spently/core/constants/app_colors.dart';
import 'package:spently/core/constants/app_sizes.dart';
import 'package:spently/core/constants/app_text_styles.dart';
import 'package:spently/core/shared/mappers/app_icon_mapper.dart';
import 'package:spently/features/account/domain/entities/account_entity.dart';

class AccountCapsule extends StatelessWidget {
  final AccountEntity account;
  const AccountCapsule({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 4, top: 2, right: 14, bottom: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.radiusTwoXLarge),
        border: Border.all(color: context.border),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //? Need to change background to Account picked color, icon to Account picked icon
          CircleAvatar(
            backgroundColor: AppColors.error,
            child: Icon(AppIconMapper.fromString(account.icon!).icon(context)),
          ),
          SizedBox(width: 8),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Account name
              Text(account.name, style: AppTextStyle.labelMedium),

              // Account balance
              Text(account.balance.toString(), style: AppTextStyle.labelSmall),
            ],
          ),
        ],
      ),
    );
  }
}
