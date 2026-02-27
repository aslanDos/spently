import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spently/core/constants/app_radius.dart';
import 'package:spently/core/constants/app_spacing.dart';
import 'package:spently/core/extensions/build_context_ext.dart';
import 'package:spently/core/shared/enums/transaction_type/app_transaction_type.dart';
import 'package:spently/core/shared/widgets/header_widget.dart';
import 'package:spently/core/shared/widgets/type_toggle_widget.dart';
import 'package:spently/features/account/domain/entities/account_entity.dart';
import 'package:spently/features/account/presentation/bloc/account_bloc.dart';
import 'package:spently/features/account/presentation/pages/accounts_sheet.dart';
import 'package:spently/features/account/presentation/widgets/account_capsule_widget.dart';
import 'package:spently/features/category/domain/entities/category_entity.dart';
import 'package:spently/features/category/presentation/bloc/category_bloc.dart';
import 'package:spently/features/category/presentation/bloc/category_state.dart';
import 'package:spently/features/transaction/domain/entities/transaction_entity.dart';
import 'package:spently/features/transaction/presentation/bloc/transaction_bloc.dart';
import 'package:spently/features/transaction/presentation/bloc/transaction_event.dart';
import 'package:spently/features/transaction/presentation/bloc/transaction_state.dart';
import 'package:spently/features/transaction/presentation/widgets/amount_display_widget.dart';
import 'package:spently/features/transaction/presentation/widgets/category_picker_widget.dart';
import 'package:spently/features/transaction/presentation/widgets/date_picker_widget.dart';
import 'package:spently/features/transaction/presentation/widgets/note_field_widget.dart';
import 'package:spently/features/transaction/presentation/widgets/numpad_widget.dart';
import 'package:spently/core/shared/widgets/save_button_widget.dart';

class TransactionFormSheet extends StatefulWidget {
  final TransactionEntity? transaction;

  const TransactionFormSheet({super.key, this.transaction});

  static Future<bool?> show({
    required BuildContext context,
    TransactionEntity? transaction,
  }) {
    final transactionBloc = context.read<TransactionBloc>();
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
          BlocProvider.value(value: transactionBloc),
          BlocProvider.value(value: accountBloc),
          BlocProvider.value(value: categoryBloc),
        ],
        child: TransactionFormSheet(transaction: transaction),
      ),
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
    _selectedAccount = accountState.selectedAccount;

    if (_isEditing) {
      final t = widget.transaction!;
      _selectedType = t.type;
      _amount = t.amount.toString();
      _noteController.text = t.note ?? '';
      _selectedDate = t.date;
      _loadCategoryForEdit(t.categoryId);
    }
  }

  void _loadCategoryForEdit(String categoryId) {
    final categoryState = context.read<CategoryBloc>().state;
    if (categoryState is CategoriesLoaded) {
      final category = categoryState.categories.firstWhere(
        (c) => c.id == categoryId,
        orElse: () => categoryState.categories.first,
      );
      _selectedCategory = category;
    }
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  // Max 10 digits before decimal, 2 after (e.g., 9,999,999,999.99)
  static const int _maxDigitsBeforeDecimal = 10;
  static const int _maxDigitsAfterDecimal = 2;

  void _onNumberPressed(String number) {
    setState(() {
      if (_amount == '0' && number != '.') {
        _amount = number;
      } else if (number == '.' && _amount.contains('.')) {
        // Already has decimal, ignore
        return;
      } else if (_amount.contains('.')) {
        // Has decimal - check digits after
        final parts = _amount.split('.');
        if (parts[1].length >= _maxDigitsAfterDecimal) {
          return;
        }
        _amount += number;
      } else {
        // No decimal yet
        if (number == '.') {
          _amount += number;
        } else if (_amount.length >= _maxDigitsBeforeDecimal) {
          // Reached max digits before decimal, ignore
          return;
        } else {
          _amount += number;
        }
      }
    });
  }

  void _onDeletePressed() {
    setState(() {
      if (_amount.length > 1) {
        _amount = _amount.substring(0, _amount.length - 1);
      } else {
        _amount = '0';
      }
    });
  }

  void _onClearPressed() {
    setState(() {
      _amount = '0';
    });
  }

  Future<void> _openAccountsSheet() async {
    final selected = await AccountsSheet.showForSelection(context);
    if (!mounted) return;
    if (selected != null) {
      setState(() {
        _selectedAccount = selected;
      });
    }
  }

  void _onSavePressed() {
    final amount = double.tryParse(_amount) ?? 0;
    if (amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Amount must be greater than zero')),
      );
      return;
    }

    if (_selectedAccount == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please select an account')));
      return;
    }

    if (_selectedCategory == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please select a category')));
      return;
    }

    final transactionBloc = context.read<TransactionBloc>();

    if (_isEditing) {
      final updatedTransaction = widget.transaction!.copyWith(
        accountId: _selectedAccount!.id,
        categoryId: _selectedCategory!.id,
        amount: amount,
        type: _selectedType,
        date: _selectedDate,
        note: _noteController.text.trim().isEmpty
            ? null
            : _noteController.text.trim(),
      );
      transactionBloc.add(
        TransactionEvent.update(transaction: updatedTransaction),
      );
    } else {
      final newTransaction = TransactionEntity(
        id: '', // Will be generated by use case
        accountId: _selectedAccount!.id,
        categoryId: _selectedCategory!.id,
        amount: amount,
        type: _selectedType,
        date: _selectedDate,
        note: _noteController.text.trim().isEmpty
            ? null
            : _noteController.text.trim(),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      transactionBloc.add(TransactionEvent.create(transaction: newTransaction));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TransactionBloc, TransactionState>(
      listener: _handleTransactionState,
      child: DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.9,
        maxChildSize: 0.9,
        builder: (context, scrollcontroller) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: context.surface,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(AppRadius.radius24),
                ),
              ),
              child: Column(
                children: [
                  // Header
                  Header(
                    title: TypeToggle(
                      selected: _selectedType,
                      items: TransactionType.values,
                      onChanged: (value) {
                        setState(() {
                          _selectedType = value;
                          // Reset category when type changes
                          _selectedCategory = null;
                        });
                      },
                    ),
                  ),

                  // Content (flexible - takes remaining space)
                  Expanded(child: _buildContent()),

                  // Numpad (fixed height)
                  _buildNumpad(),
                  const SizedBox(height: AppSpacing.spacing12),

                  // Save Button (fixed height)
                  _buildSaveButton(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _handleTransactionState(BuildContext context, TransactionState state) {
    state.maybeMap(
      success: (_) => Navigator.of(context).pop(true),
      failure: (s) => ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(s.message))),
      orElse: () {},
    );
  }

  Widget _buildContent() {
    switch (_selectedType) {
      case TransactionType.income:
      case TransactionType.expense:
        return _buildIncomeExpenseContent();
      case TransactionType.transfer:
        return _buildTransferContent();
    }
  }

  Widget _buildIncomeExpenseContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildAmountDisplay(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_buildAccountCapsule(), _buildDatePicker()],
          ),
          const SizedBox(height: AppSpacing.spacing2),
          CategoryPicker(
            transactionType: _selectedType,
            selectedCategory: _selectedCategory,
            onCategorySelected: (category) {
              setState(() {
                _selectedCategory = category;
              });
            },
          ),
          const SizedBox(height: AppSpacing.spacing2),
          _buildNoteField(),
          const SizedBox(height: AppSpacing.spacing12),
        ],
      ),
    );
  }

  Widget _buildTransferContent() {
    return const SingleChildScrollView(
      child: Column(children: [Text('Transfer coming soon')]),
    );
  }

  Widget _buildAmountDisplay() => AmountDisplay(
    amount: _amount,
    transactionType: _selectedType,
  );

  Widget _buildAccountCapsule() {
    if (_selectedAccount != null) {
      return GestureDetector(
        onTap: _openAccountsSheet,
        child: AccountCapsule(
          selectedAccount: _selectedAccount,
          onAccountSelected: (_) {},
        ),
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildDatePicker() => DatePicker(
    selectedDate: _selectedDate,
    onDateChanged: (DateTime value) {
      setState(() {
        _selectedDate = value;
      });
    },
  );

  Widget _buildNoteField() => NoteField(controller: _noteController);

  Widget _buildNumpad() => Numpad(
    amount: _amount,
    onNumberPressed: _onNumberPressed,
    onDeletePressed: _onDeletePressed,
    onClearPressed: _onClearPressed,
  );

  Widget _buildSaveButton() => BlocBuilder<TransactionBloc, TransactionState>(
    builder: (context, state) {
      final isLoading = state.maybeMap(
        loading: (_) => true,
        orElse: () => false,
      );
      return SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.spacing8),
          child: SaveButton(onPressed: _onSavePressed, isLoading: isLoading),
        ),
      );
    },
  );
}
