import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scholar_time_table_app/src/core/shared/domain/Dates.dart';
import 'package:scholar_time_table_app/src/core/shared/domain/bloc/bloc_provider.dart';
import 'package:scholar_time_table_app/src/presentation/timetable/TimeTableBloc.dart';
import 'package:time_planner/time_planner.dart';

import '../TimeTableState.dart';

class TimeTableContent extends StatelessWidget{
  
  const TimeTableContent();
  
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<TimeTableBloc>(context);

    return StreamBuilder<TimeTableState>(
        initialData: bloc.state,
        stream: bloc.observableState,
        builder: (context, snapshot){
          final state = snapshot.data;
          return _renderCoursesContent(context, state!);
        });
  }

  Widget _renderCoursesContent(BuildContext context, TimeTableState state) {
    var random = Random();
    final List<TimePlannerTask> tasks = state.assignmentState!.tasks.map((e) =>
        TimePlannerTask(
            minutesDuration: e.duration.hour * 60,
            dateTime: TimePlannerDateTime(
                day: Dates.dayInWeek(e.day) - 1,
                hour: e.start.hour,
                minutes: 0,),
        color: Colors.accents[random.nextInt(Colors.accents.length)],
            onTap: () {// Permite ejecutar acción cuando hacemos click
              print(e.description);
            },
            child: Text(
              e.description,
              style: TextStyle(color: Colors.black, fontSize: 12),
            )))
        .toList();
    return TimePlanner(
      startHour: 8,
      endHour: 20,
      headers: List.generate(
        5, (index) => TimePlannerTitle(
        date: Dates.today(),
        title: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri'][index],
        ),
      ),
      tasks: tasks,
    );
  }
}