import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spently/features/account/presentation/bloc/account_bloc.dart';
import 'package:spently/features/account/presentation/bloc/account_event.dart';
import 'package:spently/features/account/presentation/bloc/account_state.dart';
import 'package:spently/features/account/presentation/pages/accounts_sheet.dart';
import 'package:spently/features/category/presentation/bloc/category_bloc.dart';
import 'package:spently/features/category/presentation/bloc/category_event.dart';
import 'package:spently/features/category/presentation/bloc/category_state.dart';
import 'package:spently/features/home/presentation/widgets/empty_transactions_widget.dart';
import 'package:spently/features/home/presentation/widgets/home_app_bar_widget.dart';
import 'package:spently/features/home/presentation/widgets/transactions_grouped_list_widget.dart';
import 'package:spently/features/transaction/domain/entities/transaction_entity.dart';
import 'package:spently/features/transaction/presentation/bloc/transaction_bloc.dart';
import 'package:spently/features/transaction/presentation/bloc/transaction_event.dart';
import 'package:spently/features/transaction/presentation/bloc/transaction_state.dart';
import 'package:spently/features/transaction/presentation/pages/transaction_form_sheet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    context.read<AccountBloc>().add(LoadAccountsEvent());
    context.read<CategoryBloc>().add(LoadCategoriesEvent());
    context.read<TransactionBloc>().add(LoadTransactionsEvent());
  }

  Future<void> _openAccountsSheet() async {
    await AccountsSheet.show(context);
  }

  Future<void> _openAddTransactionForm() async {
    final result = await TransactionFormSheet.show(context: context);
    if (result == true && mounted) {
      // Refresh data after successful transaction
      _loadData();
    }
  }

  Future<void> _openEditTransactionForm(TransactionEntity transaction) async {
    final result = await TransactionFormSheet.show(
      context: context,
      transaction: transaction,
    );
    if (result == true && mounted) {
      _loadData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(onTap: _openAccountsSheet),
      body: SafeArea(child: _buildBody()),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddTransactionForm,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildBody() {
    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, accountState) {
        final selectedAccount = accountState.selectedAccount;

        return BlocBuilder<TransactionBloc, TransactionState>(
          builder: (context, transactionState) {
            return BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, categoryState) {
                final allTransactions = transactionState.transactions;
                final categories = categoryState is CategoriesLoaded
                    ? categoryState.categories
                    : <dynamic>[];

                // Filter transactions by selected account
                final transactions = selectedAccount != null
                    ? allTransactions
                        .where((t) => t.accountId == selectedAccount.id)
                        .toList()
                    : allTransactions;

                if (transactionState.isLoading && transactions.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (transactions.isEmpty) {
                  return const EmptyTransactions();
                }

                return TransactionsGroupedList(
                  transactions: transactions,
                  categories: categories.cast(),
                  onTransactionTap: _openEditTransactionForm,
                );
              },
            );
          },
        );
      },
    );
  }
}
