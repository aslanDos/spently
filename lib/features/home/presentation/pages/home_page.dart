import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spently/features/account/presentation/bloc/account_bloc.dart';
import 'package:spently/features/account/presentation/bloc/account_event.dart';
import 'package:spently/features/account/presentation/pages/accounts_sheet.dart';
import 'package:spently/features/category/presentation/bloc/category_bloc.dart';
import 'package:spently/features/category/presentation/bloc/category_event.dart';
import 'package:spently/features/home/presentation/widgets/balance_info_widget.dart';
import 'package:spently/features/home/presentation/widgets/home_app_bar_widget.dart';
import 'package:spently/features/transaction/presentation/bloc/transaction_bloc.dart';
import 'package:spently/features/transaction/presentation/bloc/transaction_event.dart';
import 'package:spently/features/transaction/presentation/pages/transaction_form_sheet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bool isAccountHasTransactions = true;

  void _loadData() {
    context.read<AccountBloc>().add(LoadAccountsEvent());
    context.read<CategoryBloc>().add(LoadCategoriesEvent());
    context.read<TransactionBloc>().add(LoadTransactionsEvent());
  }

  Future<void> _openAccountsSheet() async {
    await AccountsSheet.show(context);
    if (mounted) _loadData();
  }

  Future<void> _openAddTransactionForm() async {
    await TransactionFormSheet.show(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(onTap: _openAccountsSheet),
      body: SafeArea(
        child: Center(
          child: isAccountHasTransactions
              ? Column(children: [const BalanceInfo()])
              : const Text('No transactions yet'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddTransactionForm,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
