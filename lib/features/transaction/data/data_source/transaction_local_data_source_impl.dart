import 'package:hive/hive.dart';
import 'package:spently/core/services/hive_service.dart';
import 'package:spently/features/transaction/data/data_source/transaction_local_data_source.dart';
import 'package:spently/features/transaction/data/models/transaction_model.dart';
import 'package:spently/features/transaction/domain/repository/transaction_repository.dart';

class TransactionLocalDataSourceImpl implements TransactionLocalDataSource {
  final HiveService _hiveService;

  TransactionLocalDataSourceImpl(this._hiveService);

  Box<TransactionModel>? _box;

  Future<Box<TransactionModel>> _getBox() async {
    _box ??= await _hiveService.openBox<TransactionModel>(
      HiveService.transactionBox,
    );
    return _box!;
  }

  @override
  Future<List<TransactionModel>> getTransactions({
    TransactionFilter? filter,
  }) async {
    final box = await _getBox();
    var transactions = box.values.toList();

    if (filter != null) {
      transactions = transactions.where((t) {
        if (filter.startDate != null && t.date.isBefore(filter.startDate!)) {
          return false;
        }
        if (filter.endDate != null && t.date.isAfter(filter.endDate!)) {
          return false;
        }
        if (filter.accountId != null && t.accountId != filter.accountId) {
          return false;
        }
        if (filter.categoryId != null && t.categoryId != filter.categoryId) {
          return false;
        }
        if (filter.type != null && t.type != filter.type) {
          return false;
        }
        return true;
      }).toList();
    }

    transactions.sort((a, b) => b.date.compareTo(a.date));
    return transactions;
  }

  @override
  Future<TransactionModel?> getTransaction(String transactionId) async {
    final box = await _getBox();
    return box.get(transactionId);
  }

  @override
  Future<void> saveTransaction(TransactionModel transaction) async {
    final box = await _getBox();
    await box.put(transaction.id, transaction);
  }

  @override
  Future<void> saveTransactions(List<TransactionModel> transactions) async {
    final box = await _getBox();
    final map = {for (var t in transactions) t.id: t};
    await box.putAll(map);
  }

  @override
  Future<void> deleteTransaction(String transactionId) async {
    final box = await _getBox();
    await box.delete(transactionId);
  }

  @override
  Future<void> clearTransactions() async {
    final box = await _getBox();
    await box.clear();
  }
}
