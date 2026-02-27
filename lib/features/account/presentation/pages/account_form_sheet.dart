import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spently/core/constants/app_radius.dart';
import 'package:spently/core/extensions/build_context_ext.dart';
import 'package:spently/core/shared/enums/icon_type/app_icon_type.dart';
import 'package:spently/core/shared/icons/app_icons.dart';
import 'package:spently/core/shared/mappers/app_color_mappers.dart';
import 'package:spently/core/shared/mappers/app_icon_mapper.dart';
import 'package:spently/core/shared/widgets/adaptive_dialog.dart';
import 'package:spently/core/shared/widgets/app_sheet.dart';
import 'package:spently/core/shared/widgets/color_picker_widget.dart';
import 'package:spently/core/shared/widgets/header_widget.dart';
import 'package:spently/core/shared/widgets/icon_picker_widget.dart';
import 'package:spently/core/shared/widgets/save_button_widget.dart';
import 'package:spently/features/account/domain/entities/account_entity.dart';
import 'package:spently/features/account/presentation/bloc/account_bloc.dart';
import 'package:spently/features/account/presentation/bloc/account_event.dart';
import 'package:spently/features/account/presentation/bloc/account_state.dart';

class AccountFormSheet extends StatefulWidget {
  final AccountEntity? account;

  const AccountFormSheet({super.key, this.account});

  static Future<bool?> show({
    required BuildContext context,
    AccountEntity? account,
  }) {
    final accountBloc = context.read<AccountBloc>();
    return AppSheet.showFlexible(
      context: context,
      child: BlocProvider.value(
        value: accountBloc,
        child: AccountFormSheet(account: account),
      ),
    );
  }

  @override
  State<AccountFormSheet> createState() => _AccountFormSheetState();
}

class _AccountFormSheetState extends State<AccountFormSheet> {
  late Color? _color;
  late AppIconType? _icon;
  late String? _currency;

  final _nameController = TextEditingController();
  final _balanceController = TextEditingController();

  bool get _isEditing => widget.account != null;

  void _onSave() {
    final name = _nameController.text.trim();
    if (name.isEmpty) return;

    final balance = double.tryParse(_balanceController.text) ?? 0.0;
    final now = DateTime.now();

    if (_isEditing) {
      final updatedAccount = widget.account!.copyWith(
        name: name,
        balance: balance,
        icon: _icon?.value ?? widget.account!.icon,
        color: _color?.toHex() ?? widget.account!.color,
        currency: _currency ?? widget.account!.currency,
        updatedAt: now,
      );
      context.read<AccountBloc>().add(
        UpdateAccountEvent(account: updatedAccount),
      );
    } else {
      final newAccount = AccountEntity(
        id: '',
        name: name,
        balance: balance,
        icon: _icon?.value,
        color: _color?.toHex(),
        currency: _currency ?? 'KZT',
        createdAt: now,
        updatedAt: now,
      );
      context.read<AccountBloc>().add(CreateAccountEvent(account: newAccount));
    }
  }

  Future<void> _onDelete() async {
    if (!_isEditing) return;

    // Check if this is the last account
    final state = context.read<AccountBloc>().state;
    final accountCount = state.accounts.length;

    if (accountCount <= 1) {
      await AdaptiveDialog.showAlert(
        context: context,
        title: 'Cannot Delete',
        content: 'You cannot delete the last account. Please create a new one before deleting.',
      );
      return;
    }

    final confirmed = await AdaptiveDialog.showConfirmation(
      context: context,
      title: 'Delete Account',
      content: 'Are you sure you want to delete "${widget.account!.name}"? This action cannot be undone.',
      confirmText: 'Delete',
      cancelText: 'Cancel',
      isDestructive: true,
    );

    if (confirmed == true && mounted) {
      context.read<AccountBloc>().add(
        DeleteAccountEvent(accountId: widget.account!.id),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    final account = widget.account;
    _color = account?.color?.toColor();
    _currency = account?.currency;
    _icon = account?.icon != null
        ? AppIconType.fromString(account!.icon!)
        : null;
    if (account != null) {
      _nameController.text = account.name;
      _balanceController.text = account.balance.toString();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _balanceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AccountBloc, AccountState>(
      listener: (context, state) {
        state.maybeWhen(
          loaded: (accounts, selected) => Navigator.of(context).pop(true),
          failure: (message, accounts, selected) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message)),
            );
          },
          orElse: () {},
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Fixed header
          Header(
            title: Text(
              _isEditing ? widget.account!.name : 'New account',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            trailingIcon: _isEditing
                ? Icon(AppIcons.trash, color: context.error)
                : null,
            trailingAction: _isEditing ? _onDelete : null,
          ),
          // Scrollable content
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _NameSection(
                    icon: _icon,
                    color: _color,
                    controller: _nameController,
                  ),
                  const SizedBox(height: 20),
                  _BalanceSection(
                    balanceController: _balanceController,
                    currency: _currency ?? 'KZT',
                  ),
                  const SizedBox(height: 2),
                  ColorPicker(
                    selectedColor: _color,
                    onColorSelected: (color) => setState(() => _color = color),
                  ),
                  const SizedBox(height: 2),
                  IconPicker(
                    selectedIcon: _icon,
                    onIconSelected: (icon) => setState(() => _icon = icon),
                  ),
                ],
              ),
            ),
          ),
          // Fixed bottom button
          const SizedBox(height: 24),
          SaveButton(onPressed: _onSave, label: _isEditing ? 'Update' : 'Save'),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Private sub-widgets
// ---------------------------------------------------------------------------

class _NameSection extends StatelessWidget {
  final AppIconType? icon;
  final Color? color;
  final TextEditingController controller;

  const _NameSection({
    required this.icon,
    required this.color,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: _cardDecoration(AppRadius.radius24),
      child: Row(
        children: [
          _IconAvatar(icon: icon, color: color),
          const SizedBox(width: 10),
          Expanded(
            child: _AppTextField(
              controller: controller,
              hintText: 'Account Name',
              cursorColor: context.colorScheme.secondary.withValues(alpha: 0.5),
            ),
          ),
        ],
      ),
    );
  }
}

class _BalanceSection extends StatelessWidget {
  final TextEditingController balanceController;
  final String currency;

  const _BalanceSection({
    required this.balanceController,
    required this.currency,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: _cardDecoration(AppRadius.radius24),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(CupertinoIcons.collections_solid),
              const SizedBox(width: 8),
              const Text('Balance'),
              const Spacer(),
              Expanded(
                child: _AppTextField(
                  controller: balanceController,
                  hintText: '0',
                  textAlign: TextAlign.right,
                  cursorColor: Colors.grey.withValues(alpha: 0.8),
                ),
              ),
            ],
          ),
          const Divider(height: 20),
          Row(
            children: [
              const Icon(Icons.currency_exchange),
              const SizedBox(width: 8),
              const Text('Currency'),
              const Spacer(),
              Text(
                currency,
                style: TextStyle(color: Colors.grey.withValues(alpha: 0.5)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _IconAvatar extends StatelessWidget {
  final AppIconType? icon;
  final Color? color;

  const _IconAvatar({this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    final hasIcon = icon != null;
    final backgroundColor = color ?? (hasIcon ? Colors.black : Colors.grey.withValues(alpha: 0.2));

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: hasIcon
            ? Icon(icon!.icon, size: 16, color: Colors.white)
            : Icon(
                CupertinoIcons.add_circled,
                size: 24,
                color: Colors.grey.withValues(alpha: 0.4),
              ),
      ),
    );
  }
}

class _AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextAlign textAlign;
  final Color cursorColor;

  const _AppTextField({
    required this.controller,
    required this.hintText,
    required this.cursorColor,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textAlign: textAlign,
      cursorHeight: 18,
      cursorColor: cursorColor,
      autocorrect: false,
      decoration: InputDecoration(
        fillColor: Colors.transparent,
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        isDense: true,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey.withValues(alpha: 0.5)),
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

BoxDecoration _cardDecoration(double radius) => BoxDecoration(
  borderRadius: BorderRadius.circular(radius),
  color: Colors.grey.withValues(alpha: 0.1),
);
