
import 'package:scholar_time_table_app/src/core/shared/domain/TimeDuration.dart';

class AssigmentState {
  final String          description;
  final List<TaskState> tasks;

  AssigmentState(this.description, this.tasks);
}

class TaskState {
  final String       description;
  final String       day;
  final TimeDuration duration;

  TaskState(this.description, this.day, this.duration);

}