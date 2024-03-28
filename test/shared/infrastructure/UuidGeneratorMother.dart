import 'package:uuid/uuid.dart';

class UuidGeneratorMother{
  static String random(){
    return Uuid().v4();
  }
}