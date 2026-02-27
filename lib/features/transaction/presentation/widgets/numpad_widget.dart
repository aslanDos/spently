import 'package:flutter/cupertino.dart';
import 'package:spently/core/constants/app_colors.dart';
import 'package:spently/core/constants/app_radius.dart';
import 'package:spently/core/constants/app_spacing.dart';
import 'package:spently/core/constants/app_text_styles.dart';
import 'package:spently/core/extensions/build_context_ext.dart';

class Numpad extends StatelessWidget {
  final String amount;
  final ValueChanged<String> onNumberPressed;
  final VoidCallback onDeletePressed;
  final VoidCallback? onClearPressed;
  final double height;

  const Numpad({
    super.key,
    required this.amount,
    required this.onNumberPressed,
    required this.onDeletePressed,
    this.onClearPressed,
    this.height = 200,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Column(
        children: [
          _buildNumpadRow(context: context, values: ['1', '2', '3']),
          const SizedBox(height: AppSpacing.spacing2),
          _buildNumpadRow(context: context, values: ['4', '5', '6']),
          const SizedBox(height: AppSpacing.spacing2),
          _buildNumpadRow(context: context, values: ['7', '8', '9']),
          const SizedBox(height: AppSpacing.spacing2),
          _buildNumpadRowWithDelete(context: context, values: ['.', '0']),
        ],
      ),
    );
  }

  Widget _buildNumpadRow({
    required BuildContext context,
    required List<String> values,
  }) {
    return Expanded(
      child: Row(
        children: List.generate(values.length, (index) {
          final value = values[index];
          final isLast = index == values.length - 1;

          return Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: isLast ? 0 : AppSpacing.spacing2),
              child: _buildNumpadButton(context: context, value: value),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildNumpadRowWithDelete({
    required BuildContext context,
    required List<String> values,
  }) {
    return Expanded(
      child: Row(
        children: [
          for (int i = 0; i < values.length; i++) ...[
            Expanded(
              child: _buildNumpadButton(context: context, value: values[i]),
            ),
            const SizedBox(width: AppSpacing.spacing2),
          ],
          Expanded(child: _buildDeleteButton(context: context)),
        ],
      ),
    );
  }

  Widget _buildNumpadButton({
    required BuildContext context,
    required String value,
  }) {
    return GestureDetector(
      onTap: () => onNumberPressed(value),
      child: Container(
        decoration: BoxDecoration(
          color: context.colorScheme.secondary.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(AppRadius.radius20),
        ),
        child: Center(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: AppFontWeight.black,
              color: context.colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDeleteButton({required BuildContext context}) {
    return GestureDetector(
      onTap: onDeletePressed,
      onLongPress: onClearPressed,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.error.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(AppRadius.radius20),
        ),
        child: Center(
          child: Icon(
            CupertinoIcons.delete_left,
            color: AppColors.error,
            size: 24,
          ),
        ),
      ),
    );
  }
}
