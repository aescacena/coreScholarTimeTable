import '../../../subjects/domain/Subject.dart';
import '../../../teacher/domain/Teacher.dart';
import '../../domain/CalendarGenerator.dart';
import '../../domain/Calendar.dart';

class SearchLocalCalendarWeeklyGenerator implements CalendarGenerator{

  @override
  Calendar? generate(Calendar calendarWeekly, List<Subject> subjects, List<Teacher> teachers) {
    return null;
  }

}