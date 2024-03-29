import '../../../subjects/domain/Subject.dart';
import '../../../teacher/domain/Teacher.dart';
import '../../domain/CalendarGenerator.dart';
import '../../domain/CalendarWeekly.dart';

class SearchLocalCalendarWeeklyGenerator implements CalendarGenerator{

  @override
  CalendarWeekly? generate(CalendarWeekly calendarWeekly, List<Subject> subjects, List<Teacher> teachers) {
    return null;
  }

}