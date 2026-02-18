import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spently/core/constants/app_colors.dart';
import 'package:spently/core/constants/app_sizes.dart';
import 'package:spently/core/shared/enums/transaction_type/app_transaction_type.dart';
import 'package:spently/features/account/domain/entities/account_entity.dart';
import 'package:spently/features/account/presentation/bloc/account_bloc.dart';
import 'package:spently/features/account/presentation/bloc/account_state.dart';
import 'package:spently/features/category/domain/entities/category_entity.dart';
import 'package:spently/features/home/presentation/widgets/account_capsule_widget.dart';
import 'package:spently/features/transaction/domain/entities/transaction_entity.dart';
import 'package:spently/features/transaction/presentation/bloc/transaction_bloc.dart';
import 'package:spently/features/transaction/presentation/bloc/transaction_state.dart';
import 'package:spently/features/transaction/presentation/widgets/amount_display_widget.dart';
import 'package:spently/features/transaction/presentation/widgets/date_picker_widget.dart';
import 'package:spently/features/transaction/presentation/widgets/transaction_form_header_widget.dart';

class TransactionFormSheet extends StatefulWidget {
  final TransactionEntity? transaction;

  const TransactionFormSheet({super.key, this.transaction});

  static Future<bool?> show({
    required BuildContext context,
    TransactionEntity? transaction,
  }) {
    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black54,
      builder: (context) => TransactionFormSheet(transaction: transaction),
    );
  }

  @override
  State<TransactionFormSheet> createState() => _TransactionFormSheetState();
}

class _TransactionFormSheetState extends State<TransactionFormSheet> {
  TransactionType _selectedType = TransactionType.expense;
  String _amount = '0';
  DateTime _selectedDate = DateTime.now();
  CategoryEntity? _selectedCategory;
  AccountEntity? _selectedAccount;

  final _noteController = TextEditingController();

  bool get _isEditing => widget.transaction != null;

  @override
  void initState() {
    super.initState();
    final accountState = context.read<AccountBloc>().state;
    if (accountState is AccountsLoaded) {
      _selectedAccount = accountState.selectedAccount;
    }
    if (_isEditing) {
      final t = widget.transaction!;
      _amount = t.amount.toString();
      _noteController.text = t.note ?? '';
      _selectedDate = t.date;
    }
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  void _closeSheet() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TransactionBloc, TransactionState>(
      listener: _handleTransactionState,
      child: DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.5,
        maxChildSize: 0.9,
        builder: (context, scrollcontroller) {
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
                  // Header
                  buildTransactionFormHeader(
                    context: context,
                    onTypeChange: (value) {
                      setState(() {
                        _selectedType = value;
                      });
                    },
                    selectedType: _selectedType,
                    onClose: _closeSheet,
                  ),
                  // Content
                  Expanded(
                    child: SingleChildScrollView(
                      controller: scrollcontroller,
                      child: _buildContent(context: context),
                    ),
                  ),
                  // Save button
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _handleTransactionState(BuildContext context, TransactionState state) {
    if (state is TransactionCreated ||
        state is TransactionUpdated ||
        state is TransactionDeleted) {
      Navigator.of(context).pop(true);
    } else if (state is TransactionError) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(state.message)));
    }
  }

  Widget _buildContent({required BuildContext context}) {
    switch (_selectedType) {
      case TransactionType.income:
      case TransactionType.expense:
        return _buildIncomeExpenseContent();
      case TransactionType.transfer:
        return _buildTransferContent();
    }
  }

  Widget _buildIncomeExpenseContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildAmountDisplay(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [_buildAccountCapsule(), _buildDatePicker()],
        ),
      ],
    );
  }

  Widget _buildTransferContent() {
    return Column(children: [Text('B')]);
  }

  Widget _buildAmountDisplay() => AmountDisplay(amount: _amount);

  Widget _buildAccountCapsule() => AccountCapsule(
    selectedAccount: _selectedAccount,
    onAccountSelected: (account) {
      setState(() {
        _selectedAccount = account;
      });
    },
  );

  Widget _buildDatePicker() => DatePicker(
    selectedDate: _selectedDate,
    onDateChanged: (DateTime value) {
      setState(() {
        _selectedDate = value;
      });
    },
  );
}
