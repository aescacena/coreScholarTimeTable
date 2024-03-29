import '../../subjects/domain/Subject.dart';
import '../../teacher/domain/Teacher.dart';
import 'CalendarWeekly.dart';

abstract class CalendarGenerator{
  CalendarWeekly? generate(CalendarWeekly calendarWeekly, List<Subject> subjects, List<Teacher> teachers);
}