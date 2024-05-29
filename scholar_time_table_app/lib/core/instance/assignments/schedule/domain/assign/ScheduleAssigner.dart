import '../ScheduleAssignment.dart';
import '../ScheduleProblem.dart';

abstract class ScheduleAssigner{
  ScheduleAssignment? solve(ScheduleProblem problem);
}