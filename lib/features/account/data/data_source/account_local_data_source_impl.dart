import 'package:hive/hive.dart';
import 'package:spently/core/services/hive_service.dart';
import 'package:spently/features/account/data/data_source/account_local_data_source.dart';
import 'package:spently/features/account/data/models/account_model.dart';

class AccountLocalDataSourceImpl implements AccountLocalDataSource {
  final HiveService _hiveService;

  AccountLocalDataSourceImpl(this._hiveService);

  Future<Box<AccountModel>> _getBox() =>
      _hiveService.openBox<AccountModel>(HiveService.accountsBox);

  @override
  Future<void> clearAccounts() async {
    final box = await _getBox();
    await box.clear();
  }

  @override
  Future<void> deleteAccount(String accountId) async {
    final box = await _getBox();
    await box.delete(accountId);
  }

  @override
  Future<AccountModel?> getAccount(String accountId) async {
    final box = await _getBox();
    return box.get(accountId);
  }

  @override
  Future<List<AccountModel>> getAccounts() async {
    final box = await _getBox();
    return box.values.toList();
  }

  @override
  Future<void> saveAccount(AccountModel account) async {
    final box = await _getBox();
    await box.put(account.id, account);
  }

  @override
  Future<void> saveAccounts(List<AccountModel> accounts) async {
    final box = await _getBox();

    final Map<String, AccountModel> map = {
      for (var account in accounts) account.id: account,
    };

    await box.putAll(map);
  }
}
