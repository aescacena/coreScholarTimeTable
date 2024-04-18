import 'package:faker/faker.dart';
import 'package:uuid/uuid.dart';

class UuidGeneratorMother{
  static String random(){
    return Uuid().v4();
  }

  static List<String> randomList(){
    List<String> uuIds = [];
    var total = faker.randomGenerator.integer(20, min: 3);
    for(int i = 0; i < total; i ++){
      uuIds.add(random());
    }
    return uuIds;
  }
}