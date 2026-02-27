import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spently/core/shared/icons/app_icons.dart';
import 'package:spently/core/shared/widgets/app_sheet.dart';
import 'package:spently/core/shared/widgets/header_widget.dart';
import 'package:spently/features/account/domain/entities/account_entity.dart';
import 'package:spently/features/account/presentation/bloc/account_bloc.dart';
import 'package:spently/features/account/presentation/bloc/account_event.dart';
import 'package:spently/features/account/presentation/bloc/account_state.dart';
import 'package:spently/features/account/presentation/pages/account_form_sheet.dart';
import 'package:spently/features/account/presentation/widgets/account_add_card_widget.dart';
import 'package:spently/features/account/presentation/widgets/account_card.dart';

class AccountsSheet extends StatefulWidget {
  /// Optional callback for local selection (doesn't affect global state)
  final ValueChanged<AccountEntity>? onAccountSelected;

  const AccountsSheet({super.key, this.onAccountSelected});

  /// Shows the sheet for global account selection (affects AccountBloc state)
  static Future<bool?> show(BuildContext context) {
    final accountBloc = context.read<AccountBloc>();
    return AppSheet.show(
      context: context,
      initialChildSize: 0.9,
      minChildSize: 0.9,
      maxChildSize: 0.9,
      child: BlocProvider.value(
        value: accountBloc,
        child: const AccountsSheet(),
      ),
    );
  }

  /// Shows the sheet for local account selection (returns selected account without affecting global state)
  static Future<AccountEntity?> showForSelection(BuildContext context) {
    final accountBloc = context.read<AccountBloc>();
    AccountEntity? selectedAccount;

    return AppSheet.show<AccountEntity?>(
      context: context,
      initialChildSize: 0.9,
      minChildSize: 0.9,
      maxChildSize: 0.9,
      child: BlocProvider.value(
        value: accountBloc,
        child: AccountsSheet(
          onAccountSelected: (account) {
            selectedAccount = account;
          },
        ),
      ),
    ).then((_) => selectedAccount);
  }

  @override
  State<AccountsSheet> createState() => _AccountsSheetState();
}

class _AccountsSheetState extends State<AccountsSheet> {
  bool _shuffleMode = false;

  Future<void> _openAccountForm({AccountEntity? account}) async {
    await AccountFormSheet.show(context: context, account: account);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountBloc, AccountState>(
      listener: (context, state) {
        state.maybeWhen(
          failure: (message, _, __) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(message)));
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return Column(
          children: [
            Header(
              title: const Text('Accounts', style: TextStyle(fontSize: 18)),
              trailingIcon: _shuffleMode
                  ? const Icon(AppIcons.check)
                  : const Icon(AppIcons.arrowUpDown),
              trailingAction: () => setState(() {
                _shuffleMode = !_shuffleMode;
              }),
            ),
            Expanded(
              child: _buildContent(context: context, state: state),
            ),
          ],
        );
      },
    );
  }

  void _selectAccount(AccountEntity account) {
    if (widget.onAccountSelected != null) {
      // Local selection mode - just call callback and close
      widget.onAccountSelected!(account);
      Navigator.of(context).pop();
    } else {
      // Global selection mode - update bloc state
      context.read<AccountBloc>().add(SelectAccountEvent(accountId: account.id));
      Navigator.of(context).pop();
    }
  }

  Widget _buildContent({
    required BuildContext context,
    required AccountState state,
  }) {
    return state.maybeWhen(
      loaded: (accounts, selectedAccount) {
        final sortedAccounts = List<AccountEntity>.from(accounts)
          ..sort((a, b) => a.order.compareTo(b.order));
        return ListView.builder(
          itemCount: sortedAccounts.length + 1,
          itemBuilder: (context, index) {
            if (index == sortedAccounts.length) {
              return buildAddAccountCard(
                context: context,
                onTap: _openAccountForm,
              );
            }
            final account = sortedAccounts[index];
            return AccountCard(
              shuffleMode: _shuffleMode,
              account: account,
              onTap: () => _selectAccount(account),
              onEdit: !_shuffleMode
                  ? () => _openAccountForm(account: account)
                  : null,
            );
          },
        );
      },
      loading: (accounts, _) {
        if (accounts.isNotEmpty) {
          final sortedAccounts = List<AccountEntity>.from(accounts)
            ..sort((a, b) => a.order.compareTo(b.order));
          return Stack(
            children: [
              ListView.builder(
                itemCount: sortedAccounts.length + 1,
                itemBuilder: (context, index) {
                  if (index == sortedAccounts.length) {
                    return buildAddAccountCard(
                      context: context,
                      onTap: _openAccountForm,
                    );
                  }
                  final account = sortedAccounts[index];
                  return AccountCard(
                    shuffleMode: _shuffleMode,
                    account: account,
                    onTap: () => _selectAccount(account),
                    onEdit: !_shuffleMode
                        ? () => _openAccountForm(account: account)
                        : null,
                  );
                },
              ),
              const Center(child: CircularProgressIndicator()),
            ],
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
      orElse: () => const Center(child: Text('No accounts found')),
    );
  }
}
