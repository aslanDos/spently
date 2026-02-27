import 'package:flutter/material.dart';
import 'package:spently/core/constants/app_colors.dart';
import 'package:spently/core/constants/app_radius.dart';
import 'package:spently/core/constants/app_spacing.dart';
import 'package:spently/core/extensions/build_context_ext.dart';

class NoteField extends StatelessWidget {
  final TextEditingController controller;
  const NoteField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.secondary.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(AppRadius.radius24),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.spacing12,
        vertical: AppSpacing.spacing8,
      ),
      child: TextField(
        controller: controller,
        autocorrect: false,
        decoration: InputDecoration(
          fillColor: AppColors.transparent,
          hintText: 'Add a note...',
          hintStyle: TextStyle(color: Colors.grey.withValues(alpha: 0.5)),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          isDense: true,
          contentPadding: EdgeInsets.zero,
        ),
        style: TextStyle(color: context.colorScheme.primary),
        cursorColor: Colors.grey.withValues(alpha: 0.8),
      ),
    );
  }
}
