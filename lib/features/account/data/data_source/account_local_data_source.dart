import 'package:spently/features/account/data/models/account_model.dart';

abstract class AccountLocalDataSource {
  Future<List<AccountModel>> getAccounts();
  Future<AccountModel?> getAccount(String accountId);
  Future<void> saveAccount(AccountModel account);
  Future<void> saveAccounts(List<AccountModel> accounts);
  Future<void> deleteAccount(String accountId);
  Future<void> clearAccounts();
}
