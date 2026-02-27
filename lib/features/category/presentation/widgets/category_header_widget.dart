import 'package:flutter/material.dart';
import 'package:spently/core/shared/icons/app_icons.dart';
import 'package:spently/core/shared/widgets/header_action_button_widget.dart';

Widget buildCategoryHeader({
  required VoidCallback onClose,
  required BuildContext context,
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
              icon: Icon(AppIcons.close),
              onTap: onClose,
            ),
          ),

          // Title
          Text(
            'Категории',
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),

          // Add button
          Align(
            alignment: Alignment.centerRight,
            child: HeaderActionButton(icon: Icon(AppIcons.add), onTap: onClose),
          ),
        ],
      ),
    ),
  );
}
