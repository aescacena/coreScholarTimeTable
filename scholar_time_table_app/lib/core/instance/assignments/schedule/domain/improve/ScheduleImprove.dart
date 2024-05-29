import '../ScheduleAssignment.dart';
import '../ScheduleProblem.dart';

abstract class ScheduleImprover{
  final ScheduleProblem  problem;
  final List<List<List>> assignments;
  ScheduleImprover(this.problem, this.assignments);
  ScheduleAssignment? improve();
}