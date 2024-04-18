import '../../../../../core/instance/calendar/domain/Calendar.dart';
import '../../../../../core/instance/calendar/domain/CalendarDay.dart';
import '../../../../../core/instance/calendar/domain/CalendarId.dart';
import 'CalendarDayMother.dart';
import 'CalendarIdMother.dart';

class CalendarMother{
  static Calendar create(CalendarId id, List<CalendarDay> days){
    return Calendar.createWithDays(id, days);
  }

  static Calendar random(){
    return create(CalendarIdMother.random(), CalendarDayMother.randomList());
  }

  static Calendar withDates(List<String> dates){
    return create(CalendarIdMother.random(), CalendarDayMother.withDates(dates));
  }
}