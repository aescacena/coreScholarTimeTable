import 'package:scholar_time_table_app/src/core/shared/domain/Dates.dart';

import '../../core/shared/domain/Time.dart';
import 'AssigmentState.dart';

enum TimeTableStateKind{
  LOADING, LOADED, ERROR
}

class TimeTableState{
  final TimeTableStateKind kind;
  final List<String>       calendars;
  final int                numberDays;
  final String             firstDay;
  final Time               start;
  final Time               end;
  final AssigmentState?    assignmentState;

  TimeTableState._(
      this.kind, this.calendars, this.numberDays, this.firstDay, this.start,
      this.end, this.assignmentState);


  static TimeTableState initial() {
    return TimeTableState._(
        TimeTableStateKind.LOADED, [], 5, Dates.today(), new Time(8, 0),
        new Time(20, 0), null);
  }

  static TimeTableState fake(){
    return TimeTableState._(
        TimeTableStateKind.LOADED, [], 5, Dates.today(), new Time(8, 0),
        new Time(20, 0), AssigmentState.fake());
  }

}
