
import 'package:scholar_time_table_app/src/core/shared/domain/TimeDuration.dart';

import '../../core/shared/domain/Dates.dart';
import '../../core/shared/domain/Time.dart';

class AssigmentState {
  final String          description;
  final List<TaskState> tasks;

  AssigmentState(this.description, this.tasks);

  static AssigmentState fake(){
    List<TaskState> tasks = [];
    // SISTEMAS DE CARGAS
    tasks.add(TaskState("SC", Time(8, 0), Dates.today(), TimeDuration.create(3, 0)));
    tasks.add(TaskState("SC", Time(8, 0), Dates.addDaysFromToday(4), TimeDuration.create(3, 0)));
    // MOTORES
    tasks.add(TaskState("M", Time(11, 0), Dates.today(), TimeDuration.create(2, 0)));
    tasks.add(TaskState("M", Time(12, 0), Dates.addDaysFromToday(4), TimeDuration.create(3, 0)));
    // FORMACIÓN Y ORIENTACIÓN
    tasks.add(TaskState("FO", Time(13, 0), Dates.today(), TimeDuration.create(1, 0)));
    tasks.add(TaskState("FO", Time(9, 0), Dates.addDaysFromToday(1), TimeDuration.create(2, 0)));
    // INGLÉS TÉCNICO
    tasks.add(TaskState("I", Time(8, 0), Dates.addDaysFromToday(1), TimeDuration.create(1, 0)));
    tasks.add(TaskState("I", Time(12, 0), Dates.addDaysFromToday(2), TimeDuration.create(1, 0)));
    // TUTORIA PRIMERO
    tasks.add(TaskState("T", Time(11, 0), Dates.addDaysFromToday(1), TimeDuration.create(1, 0)));
    // MECANIZADO BÁSICO
    tasks.add(TaskState("MB", Time(12, 0), Dates.addDaysFromToday(1), TimeDuration.create(3, 0)));
    // SISTEMAS DE SEGURIDAD
    tasks.add(TaskState("SD", Time(8, 0), Dates.addDaysFromToday(2), TimeDuration.create(4, 0)));
    // CIRCUITOS DE FLUÍDOS
    tasks.add(TaskState("CF", Time(8, 0), Dates.addDaysFromToday(3), TimeDuration.create(4, 0)));
    tasks.add(TaskState("CF", Time(11, 0), Dates.addDaysFromToday(4), TimeDuration.create(3, 0)));

    return AssigmentState("Calendar fake", tasks);
  }
}

class TaskState {
  final String       description;
  final String       day;
  final Time         start;
  final TimeDuration duration;

  TaskState(this.description, this.start, this.day, this.duration);

}