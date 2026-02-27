import 'package:flutter/material.dart';
import 'package:spently/core/shared/icons/app_icons.dart';
import 'package:spently/core/shared/widgets/header_action_button_widget.dart';

class Header extends StatelessWidget {
  final Widget title;
  final Icon? trailingIcon;
  final VoidCallback? trailingAction;

  const Header({
    super.key,
    required this.title,
    this.trailingIcon,
    this.trailingAction,
  });

  @override
  Widget build(BuildContext context) {
    const double sideWidth = 56; // фиксированная ширина зоны

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Row(
        children: [
          /// LEFT (Close)
          SizedBox(
            width: sideWidth,
            child: Align(
              alignment: Alignment.centerLeft,
              child: HeaderActionButton(
                icon: const Icon(AppIcons.close),
                onTap: () => Navigator.of(context).pop(),
              ),
            ),
          ),

          /// CENTER (Title)
          Expanded(child: Center(child: title)),

          /// RIGHT (Action)
          SizedBox(
            width: sideWidth,
            child: Align(
              alignment: Alignment.centerRight,
              child: trailingIcon != null
                  ? HeaderActionButton(
                      icon: trailingIcon!,
                      onTap: trailingAction!,
                    )
                  : const SizedBox(),
            ),
          ),
        ],
      ),
    );
  }
}
