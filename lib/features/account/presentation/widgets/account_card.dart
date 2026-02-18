import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spently/core/shared/mappers/app_icon_mapper.dart';
import 'package:spently/features/account/domain/entities/account_entity.dart';

Widget buildAccountCard({
  required BuildContext context,
  required AccountEntity account,
}) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          // Left Icon Circle
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green.withValues(alpha: .2),
            ),
            child: Icon(
              AppIconMapper.fromString(account.icon.toString()).icon(context),
              color: Colors.green,
              size: 22,
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Text(
              account.name,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),

          Text(
            account.balance.toString(),
            style: Theme.of(context).textTheme.titleMedium,
          ),

          const SizedBox(width: 12),

          GestureDetector(
            onTap: () {},
            child: const Icon(CupertinoIcons.pencil, size: 20),
          ),
        ],
      ),
    ),
  );
}
