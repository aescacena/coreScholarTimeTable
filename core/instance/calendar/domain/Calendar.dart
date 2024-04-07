import '../../../shared/domain/Dates.dart';
import 'CalendarDay.dart';

class Calendar{
  final int               id;
  final List<CalendarDay> _days;

  Calendar._(this.id, this._days);

  static Calendar createWith(int id, String firstDay, int numberDays){
    return Calendar._(id, Calendar._generateEmptyDays(firstDay, numberDays));
  }

  static List<CalendarDay> _generateEmptyDays(String firstDay, int numberDays){
    List<CalendarDay> days = [];
    Dates.daysFrom(firstDay, numberDays).forEach((day) => days.add(CalendarDay.emptyDay(day)));
    return days;
  }

  List<String> dates(){
    return this._days.map((e) => e.date).toList();
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Calendar &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          _days == other._days;

  @override
  int get hashCode => id.hashCode ^ _days.hashCode;
}