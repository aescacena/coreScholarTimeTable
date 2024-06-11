import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scholar_time_table_app/schedule_widget.dart';

import 'src/core/instance/assignments/schedule/domain/ScheduleAssignment.dart';
import 'src/core/instance/assignments/schedule/domain/ScheduleClassRoom.dart';
import 'src/core/instance/assignments/schedule/domain/ScheduleCourse.dart';
import 'src/core/instance/assignments/schedule/domain/ScheduleProblem.dart';
import 'src/core/instance/assignments/schedule/domain/ScheduleSubject.dart';
import 'src/core/instance/assignments/schedule/domain/ScheduleTeacher.dart';
import 'src/core/instance/assignments/schedule/domain/ScheduleTimeFrame.dart';
import 'src/core/instance/assignments/schedule/domain/assign/backtracking/BacktrackingScheduleAssigner.dart';
import 'src/core/instance/assignments/schedule/domain/improve/simulatedAnnealing/SimulatedAnnealingScheduleImprove.dart';

class HomeScreen extends StatefulWidget{
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScheduleProblem    problem;
  late ScheduleAssignment assignment;

  @override
  void initState() {
    super.initState();
    var subjects   = [ScheduleSubject("S1", [1, 1]), ScheduleSubject("S2", [1, 1])];
    var teachers   = [ScheduleTeacher("T1", ["S1"]), ScheduleTeacher("T2", ["S2"])];
    var classRooms = [ScheduleClassRoom("A1"), ScheduleClassRoom("A2")];
    var courses    = [ScheduleCourse("G1", ["S1"], 0), ScheduleCourse("G2", ["S2"], 1)];
    List<ScheduleTimeFrame> timeFrames = [];
    var days = 5;
    var periodPerTurn = 4;
    for(var day = 0; day < days; day++){
      timeFrames.addAll(List.generate(periodPerTurn, (index) => ScheduleTimeFrame(day, (index), 0)));
      timeFrames.addAll(List.generate(periodPerTurn, (index) => ScheduleTimeFrame(day, (index), 1)));
    }
    var problem    = new ScheduleProblem(subjects, teachers, classRooms, courses, timeFrames);
    var assign     = new BacktrackingScheduleAssigner();
    var localAssignment = assign.solve(problem); // Llama a tu algoritmo de Backtracking
    if(localAssignment != null){
      assignment = localAssignment;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule App'),
      ),
      body: Column(
        children: [
          ScheduleWidget(assignment: assignment),
          ElevatedButton(
            onPressed: _improveSchedule,
            child: Text('Mejorar Horario'),
          ),
        ],
      ),
    );
  }

  void _improveSchedule() {
    var saScheduler = SimulatedAnnealingScheduleImprove.create(assignment);
    var improvedAssignment = saScheduler.improve();
    setState(() {
      assignment = improvedAssignment!;
    });
  }
}