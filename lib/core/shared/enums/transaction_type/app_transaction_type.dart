import 'package:hive/hive.dart';

part 'app_transaction_type.g.dart';

@HiveType(typeId: 4)
enum TransactionType {
  @HiveField(0)
  income,
  @HiveField(1)
  expense,
  @HiveField(2)
  transfer,
}
