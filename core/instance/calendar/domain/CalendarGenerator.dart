import '../../subjects/domain/Subject.dart';
import '../../teacher/domain/Teacher.dart';
import 'Calendar.dart';

abstract class CalendarGenerator{
  Calendar? generate(Calendar calendarWeekly, List<Subject> subjects, List<Teacher> teachers);
}