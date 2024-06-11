import 'package:flutter/material.dart';

import 'src/core/instance/assignments/schedule/domain/ScheduleAssignment.dart';

class ScheduleWidget extends StatelessWidget {
  final ScheduleAssignment assignment;

  ScheduleWidget({required this.assignment});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: assignment.problem.subjects.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Subject ${assignment.problem.subjects[index].id}'),
            subtitle: Text('Sessions: ${assignment.problem.subjects[index].totalSessions()}'),
          );
        },
      ),
    );
  }
}