import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spently/core/shared/icons/app_icons.dart';
import 'package:spently/core/shared/widgets/header_action_button_widget.dart';

Widget buildAccountHeader({
  required BuildContext context,
  required VoidCallback onOpenCategoriesSheet,
  required VoidCallback onClose,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 24),
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

          // Title
          Text(
            'Счета',
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),

          Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Add button
                HeaderActionButton(
                  icon: Icon(AppIcons.add(context), size: 18),
                  onTap: onOpenCategoriesSheet,
                ),

                const SizedBox(width: 12),
                // Filter button
                HeaderActionButton(
                  icon: Icon(AppIcons.sort(context), size: 18),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
