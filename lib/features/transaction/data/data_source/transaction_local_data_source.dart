import 'package:spently/features/transaction/data/models/transaction_model.dart';
import 'package:spently/features/transaction/domain/repository/transaction_repository.dart';

abstract class TransactionLocalDataSource {
  Future<List<TransactionModel>> getTransactions({TransactionFilter? filter});

  Future<TransactionModel?> getTransaction(String transactionId);

  Future<void> saveTransaction(TransactionModel transaction);

  Future<void> saveTransactions(List<TransactionModel> transactions);

  Future<void> deleteTransaction(String transactionId);

  Future<void> clearTransactions();
}
