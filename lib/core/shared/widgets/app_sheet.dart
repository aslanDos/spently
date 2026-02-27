import 'package:flutter/material.dart';
import 'package:spently/core/constants/app_radius.dart';
import 'package:spently/core/constants/app_spacing.dart';
import 'package:spently/core/extensions/build_context_ext.dart';

class AppSheet extends StatelessWidget {
  final Widget child;
  final double initialChildSize;
  final double minChildSize;
  final double maxChildSize;
  final EdgeInsets padding;

  const AppSheet({
    super.key,
    required this.child,
    this.initialChildSize = 0.9,
    this.minChildSize = 0.9,
    this.maxChildSize = 0.9,
    this.padding = const EdgeInsets.symmetric(horizontal: AppSpacing.spacing16),
  });

  /// Whether the sheet has a fixed height (min == max).
  /// Fixed sheets give a finite height constraint — children can use Expanded.
  /// Scrollable sheets use SingleChildScrollView — children must shrink-wrap.
  bool get _isFixedSize => minChildSize == maxChildSize;

  /// Shows a fixed/scrollable sheet with specified size percentages.
  static Future<T?> show<T>({
    required BuildContext context,
    required Widget child,
    double initialChildSize = 0.9,
    double minChildSize = 0.9,
    double maxChildSize = 0.9,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black54,
      builder: (_) => AppSheet(
        initialChildSize: initialChildSize,
        minChildSize: minChildSize,
        maxChildSize: maxChildSize,
        child: child,
      ),
    );
  }

  /// Shows a flexible sheet that sizes to its content.
  /// The sheet will be as tall as needed (up to maxHeightFraction of screen).
  static Future<T?> showFlexible<T>({
    required BuildContext context,
    required Widget child,
    double maxHeightFraction = 0.9,
    EdgeInsets padding = const EdgeInsets.symmetric(horizontal: AppSpacing.spacing16),
    bool enableDrag = true,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: enableDrag,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black54,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * maxHeightFraction,
      ),
      builder: (_) => _FlexibleSheetContent(
        padding: padding,
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: initialChildSize,
      minChildSize: minChildSize,
      maxChildSize: maxChildSize,
      builder: (context, scrollController) {
        return Container(
          padding: padding,
          decoration: BoxDecoration(
            color: context.surface,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(AppRadius.radius24),
            ),
          ),
          child: _isFixedSize
              // Fixed height: child gets a finite constraint, can use Expanded
              ? child
              // Scrollable: child must shrink-wrap (no Expanded allowed)
              : SingleChildScrollView(
                  controller: scrollController,
                  child: child,
                ),
        );
      },
    );
  }
}

/// Content wrapper for flexible sheets that sizes to content.
class _FlexibleSheetContent extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;

  const _FlexibleSheetContent({
    required this.child,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: context.surface,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(AppRadius.radius24),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Drag handle
            Container(
              margin: const EdgeInsets.only(top: 8, bottom: 8),
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            // Child handles its own scrolling if needed
            Flexible(child: child),
            // Bottom padding for safe area
            SizedBox(height: MediaQuery.of(context).padding.bottom),
          ],
        ),
      ),
    );
  }
}
