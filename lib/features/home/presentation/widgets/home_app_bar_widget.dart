import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spently/features/account/presentation/bloc/account_bloc.dart';
import 'package:spently/features/account/presentation/bloc/account_event.dart';
import 'package:spently/features/account/presentation/bloc/account_state.dart';
import 'package:spently/features/account/presentation/widgets/account_capsule_widget.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onTap;
  const HomeAppBar({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: BlocBuilder<AccountBloc, AccountState>(
        builder: (context, state) {
          return state.maybeWhen(
            loaded: (accounts, selectedAccount) => GestureDetector(
              onTap: onTap,
              child: AccountCapsule(
                selectedAccount: selectedAccount,
                onAccountSelected: (account) => context.read<AccountBloc>().add(
                  SelectAccountEvent(accountId: account.id),
                ),
              ),
            ),
            loading: (accounts, selectedAccount) {
              if (selectedAccount != null) {
                return GestureDetector(
                  onTap: onTap,
                  child: AccountCapsule(
                    selectedAccount: selectedAccount,
                    onAccountSelected: (account) => context
                        .read<AccountBloc>()
                        .add(SelectAccountEvent(accountId: account.id)),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
