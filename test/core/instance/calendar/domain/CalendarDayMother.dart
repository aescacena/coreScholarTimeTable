import '../../../../../core/instance/calendar/domain/CalendarDay.dart';
import '../../../../shared/domain/DateMother.dart';
import '../../../../shared/infrastructure/UuidGeneratorMother.dart';

class CalendarDayMother{
  static CalendarDay create(String date, List<String> sessions){
    return CalendarDay.withSessions(date, sessions);
  }

  static CalendarDay random(){
    var date = DateMother.random();
    var sessionsIds = UuidGeneratorMother.randomList();
    return create(date, sessionsIds);
  }

  static CalendarDay randomWithDate(String date){
    var sessionsIds = UuidGeneratorMother.randomList();
    return create(date, sessionsIds);
  }

  static CalendarDay randomWithSessionAndDate(String sessionId, String date){
    var sessionsIds = UuidGeneratorMother.randomList();
    sessionsIds.add(sessionId);
    return create(date, sessionsIds);
  }

  static List<CalendarDay> randomList(){
    List<CalendarDay> calendarDays = [];
    var dates = DateMother.randomList();
    for(var date in dates){
      calendarDays.add(randomWithDate(date));
    }
    return calendarDays;
  }

  static List<CalendarDay> withDates(List<String> dates){
    List<CalendarDay> calendarDays = [];
    for(var date in dates){
      calendarDays.add(randomWithDate(date));
    }
    return calendarDays;
  }
}