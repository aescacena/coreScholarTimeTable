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
    final List<TimePlannerTask> tasks = [
      TimePlannerTask(
          minutesDuration: 60,
          dateTime: new TimePlannerDateTime(day: 2, hour: 3, minutes: 0)),
      TimePlannerTask(
          minutesDuration: 30,
          dateTime: new TimePlannerDateTime(day: 5, hour: 0, minutes: 10))
    ];
    return TimePlanner(
      startHour: 0,
      endHour: 23,
      headers: List.generate(
        7,
            (index) => TimePlannerTitle(
          date: Dates.today(),
          title: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'][index],
        ),
      ),
      tasks: tasks,
    );
  }
}