import 'package:flutter/material.dart';
import 'package:spently/features/account/presentation/pages/accounts_sheet.dart';
import 'package:spently/features/home/presentation/widgets/balance_info_widget.dart';
import 'package:spently/features/home/presentation/widgets/home_app_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //? Need to get account transactions is empty
  final bool isAccountHasTransactions = true;

  Future<void> _openAccountsSheet() async {
    await AccountsSheet.show(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(onTap: _openAccountsSheet),
      body: SafeArea(
        child: Center(
          child: isAccountHasTransactions
              ? Column(
                  children: [
                    BalanceInfo(),
                    // ElevatedButton(
                    //   onPressed: () async {
                    //     await context.read<AccountBloc>()
                    //       ..add(SeedDefaultAccountEvent());
                    //   },
                    //   child: Text("Reseed"),
                    // ),
                  ],
                )
              : const Text('No transactions yet'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
