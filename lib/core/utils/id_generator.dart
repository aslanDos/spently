import 'package:uuid/uuid.dart';

abstract class IdGenerator {
  String generate();
}

class UuidGenerator implements IdGenerator {
  final Uuid _uuid;

  UuidGenerator(this._uuid);

  @override
  String generate() => _uuid.v4();
}
