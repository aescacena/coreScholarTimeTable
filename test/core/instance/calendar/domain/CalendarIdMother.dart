import '../../../../../core/instance/calendar/domain/CalendarId.dart';
import '../../../../shared/infrastructure/UuidGeneratorMother.dart';

class CalendarIdMother{
  static CalendarId create(String value){
    return new CalendarId(value);
  }

  static CalendarId random(){
    return new CalendarId(UuidGeneratorMother.random());
  }
}