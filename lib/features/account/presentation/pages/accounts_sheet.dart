import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spently/core/constants/app_colors.dart';
import 'package:spently/core/constants/app_sizes.dart';
import 'package:spently/features/account/presentation/bloc/account_bloc.dart';
import 'package:spently/features/account/presentation/bloc/account_event.dart';
import 'package:spently/features/account/presentation/bloc/account_state.dart';
import 'package:spently/features/account/presentation/widgets/account_card.dart';
import 'package:spently/features/account/presentation/widgets/account_header.dart';
import 'package:spently/features/category/presentation/bloc/category_bloc.dart';
import 'package:spently/features/category/presentation/pages/categories_sheet.dart';

class AccountsSheet extends StatefulWidget {
  const AccountsSheet({super.key});

  static Future<bool?> show(BuildContext context) {
    final accountBloc = context.read<AccountBloc>();
    final categoryBloc = context.read<CategoryBloc>();
    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black54,
      builder: (_) => MultiBlocProvider(
        providers: [
          BlocProvider.value(value: accountBloc),
          BlocProvider.value(value: categoryBloc),
        ],
        child: const AccountsSheet(),
      ),
    );
  }

  @override
  State<AccountsSheet> createState() => _AccountsSheetState();
}

class _AccountsSheetState extends State<AccountsSheet> {
  Future<void> _openCategoriesSheet() async {
    await CategoriesSheet.show(context);
  }

  void _closeSheet() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountBloc, AccountState>(
      listener: (context, state) {
        if (state is AccountDeleted ||
            state is AccountCreated ||
            state is AccountUpdated) {
          context.read<AccountBloc>().add(LoadAccountsEvent());
        } else if (state is AccountError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return DraggableScrollableSheet(
          initialChildSize: 0.9,
          minChildSize: 0.5,
          maxChildSize: 0.9,
          builder: (context, scollcontroller) {
            return GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: context.surface,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(AppSizes.radiusTwoXLarge),
                  ),
                ),
                child: Column(
                  children: [
                    buildAccountHeader(
                      context: context,
                      onOpenCategoriesSheet: _openCategoriesSheet,
                      onClose: _closeSheet,
                    ),
                    _buildContent(
                      context: context,
                      state: state,
                      scrollController: scollcontroller,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildContent({
    required BuildContext context,
    required AccountState state,
    required ScrollController scrollController,
  }) {
    if (state is AccountsLoaded) {
      final accounts = state.accounts;

      return Expanded(
        child: ListView.builder(
          controller: scrollController,
          itemCount: accounts.length,
          itemBuilder: (context, index) {
            final account = accounts[index];

            return buildAccountCard(context: context, account: account);
          },
        ),
      );
    }

    return const Center(child: Text('No accounts found'));
  }
}
