import '../../../shared/domain/Dates.dart';
import 'CalendarDay.dart';
import 'CalendarId.dart';

class Calendar{
  final CalendarId        id;
  final List<CalendarDay> _days;

  Calendar._(this.id, this._days);

  static Calendar createWithNumberOfDays(CalendarId id, String firstDay, int numberDays){
    return Calendar._(id, Calendar._generateEmptyDays(firstDay, numberDays));
  }

  static Calendar createWithDays(CalendarId id, List<CalendarDay> days){
    return Calendar._(id, days);
  }

  static List<CalendarDay> _generateEmptyDays(String firstDay, int numberDays){
    List<CalendarDay> days = [];
    Dates.daysFrom(firstDay, numberDays).forEach((day) => days.add(CalendarDay.emptyDay(day)));
    return days;
  }

  List<String> dates(){
    return this._days.map((e) => e.date).toList();
  }

  Calendar addSessionOn(String date, String sessionId){
    var calendarDay = _searchCalendarDateByDate(date);
    if(calendarDay == null){
      return Calendar._(id, _days);
    }
    var days = _days
        .map((oldDay) => {oldDay.date == date ? oldDay.addSession(sessionId) : oldDay})
        .expand((day) => day)
        .toList();
    return Calendar._(id, days);
  }

  Calendar removeSessionOn(String date, String sessionId) {
    var calendarDay = _searchCalendarDateByDate(date);
    if(calendarDay == null){
      return Calendar._(id, _days);
    }
    var days = _days
        .map((oldDay) => {oldDay.date == date ? oldDay.removeSession(sessionId) : oldDay})
        .expand((day) => day)
        .toList();
    return Calendar._(id, days);
  }

  List<String> sessionsOn(String date){
    var calendarDay = _searchCalendarDateByDate(date);
    return calendarDay != null ? calendarDay.sessions : [];
  }

  Calendar changeSessionDate(String sessionToChange, String initialDate, String finalDate) {
    var calendarInitialDate = _searchCalendarDateByDate(initialDate);
    var calendarFinalDate   = _searchCalendarDateByDate(finalDate);
    if(calendarInitialDate == null || calendarFinalDate == null || calendarInitialDate.notContains(sessionToChange)){
      return this;
    }
    var withoutSession = this.removeSessionOn(initialDate, sessionToChange);
    return withoutSession.addSessionOn(finalDate, sessionToChange);
  }

  Calendar swapSessionsBetweenDays(String firstDay, String sessionSelectedFirstDay, String secondDay, String sessionSecondDaySelected) {
    if(_notContainsSessionOnDay(firstDay, sessionSelectedFirstDay) || _notContainsSessionOnDay(secondDay, sessionSecondDaySelected)){
      return this;
    }
    var calendarOfFirstDay  = _searchCalendarDateByDate(firstDay);
    var newCalendarOfFirstDay = calendarOfFirstDay?.removeSession(sessionSelectedFirstDay);
    newCalendarOfFirstDay = newCalendarOfFirstDay?.addSession(sessionSecondDaySelected);
    var calendarOfSecondDay  = _searchCalendarDateByDate(secondDay);
    var newCalendarOfSecondDay = calendarOfSecondDay?.removeSession(sessionSecondDaySelected);
    newCalendarOfSecondDay = newCalendarOfSecondDay?.addSession(sessionSelectedFirstDay);
    if(newCalendarOfFirstDay == null || newCalendarOfSecondDay == null){
      return this;
    }
    var newCalendar = this.replaceCalendarDay(newCalendarOfFirstDay);
    return newCalendar.replaceCalendarDay(newCalendarOfSecondDay);
  }

  CalendarDay? _searchCalendarDateByDate(String date){
    for(var calendarDay in _days){
      if(calendarDay.date == date){
        return calendarDay;
      }
    }
    return null;
  }

  bool _containsSessionOnDay(String date, String sessionId){
    var calendarFound = _searchCalendarDateByDate(date);
    return (calendarFound != null && calendarFound.contains(sessionId));
  }

  bool _notContainsSessionOnDay(String date, String sessionId){
    return !_containsSessionOnDay(date, sessionId);
  }

  Calendar replaceCalendarDay(CalendarDay calendarDay){
    var days = _days
        .map((oldDay) => {oldDay.date == calendarDay.date ? calendarDay : oldDay})
        .expand((day) => day)
        .toList();
    return Calendar._(this.id, days);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Calendar &&
          runtimeType == other.runtimeType &&
          _days == other._days;

  @override
  int get hashCode => _days.hashCode;
}