import 'package:hive/hive.dart';

part 'app_category_type.g.dart';

@HiveType(typeId: 2)
enum CategoryType {
  @HiveField(0)
  income,
  @HiveField(1)
  expense,
}
