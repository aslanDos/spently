import 'package:flutter/material.dart';
import 'package:spently/core/constants/app_radius.dart';
import 'package:spently/core/extensions/build_context_ext.dart';
import 'package:spently/core/shared/icons/app_icons.dart';

Widget buildAddAccountCard({
  required BuildContext context,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.radius12),
        border: Border.all(
          color: context.colorScheme.secondary.withValues(alpha: 0.2),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            AppIcons.add,
            color: Colors.grey.withValues(alpha: 0.5),
            size: 18,
          ),
          const SizedBox(width: 8),
          Text(
            'A new account',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.withValues(alpha: 0.5),
            ),
          ),
        ],
      ),
    ),
  );
}
