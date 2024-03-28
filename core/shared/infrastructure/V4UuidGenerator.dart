import 'package:uuid/uuid.dart';

import '../domain/UuidGenerator.dart';

class V4UuidGenerator implements UuidGenerator{

  @override
  String generate() {
    return Uuid().v4();
  }
  
}