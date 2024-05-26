import '../ScheduleAssignment.dart';
import '../ScheduleProblem.dart';

abstract class ScheduleAssign{
  ScheduleAssignment? solve(ScheduleProblem problem);
}