import 'package:faker/faker.dart';

import '../../../core/shared/domain/Time.dart';

class TimeMother{
  static Time create(int hour, int minutes){
    return Time(hour, minutes);
  }

  static Time random(){
    return create(
        faker.randomGenerator.integer(23, min: 0),
        faker.randomGenerator.integer(59, min: 0));
  }
}