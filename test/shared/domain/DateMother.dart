import 'package:faker/faker.dart';

import '../../../core/shared/domain/Dates.dart';

class DateMother{
  static String random(){
    return Dates.dateTimeToString(faker.date.dateTime());
  }

  static List<String> randomList(){
    List<String> dates = [];
    var totalDates = faker.randomGenerator.integer(20);
    var now = DateTime.now();
    for(int i = 0; i < totalDates; i++){
      dates.add(Dates.dateTimeToString(now.add(Duration(days: i))));
    }
    return dates;
  }
}