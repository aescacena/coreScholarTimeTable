import 'dart:math';

import '../../ScheduleAssignment.dart';
import '../../ScheduleProblem.dart';
import '../ScheduleImprove.dart';

class SimulatedAnnealingScheduleImprove extends ScheduleImprover{
  final double initialTemperature;
  final double coolingRate;

  SimulatedAnnealingScheduleImprove._(
      ScheduleProblem problem, List<List<List>> assignments, this.initialTemperature, this.coolingRate)
      : super(problem, assignments);

  static SimulatedAnnealingScheduleImprove create(ScheduleAssignment assignment){
    return SimulatedAnnealingScheduleImprove._(assignment.problem, assignment.assignments, 100, 0.99);
  }

  @override
  ScheduleAssignment? improve() {
    var currentAssignment = ScheduleAssignment.create(this.problem, this.assignments);
    var bestAssignment    = ScheduleAssignment.create(this.problem, this.assignments);
    var currentCost       = currentAssignment.countTeacherGaps();
    var bestCost          = currentCost;

    var temperature       = initialTemperature;
    var random            = new Random();

    while(temperature > 1){
      var newAssignment = _generateNeighbor(currentAssignment);
      if(newAssignment != null){
        var newCost        = newAssignment.countTeacherGaps();
        var costDifference = newCost - currentCost;

        if(costDifference < 0 || exp(-costDifference / temperature) > random.nextDouble()){
          currentAssignment = newAssignment;
          currentCost = newCost;

          if(newCost < bestCost){
            bestAssignment = newAssignment;
            bestCost       = newCost;
          }
        }
      }
      temperature *= coolingRate;
    }
    return bestAssignment;
  }

  ScheduleAssignment? _generateNeighbor(ScheduleAssignment assignment) {
    var random  = new Random();
    var subject = random.nextInt(assignment.problem.numberSubjects());
    var oldClasRoom, oldTimeFrame, newClassRoom, newTimeFrame;

    do{
      oldClasRoom = random.nextInt(assignment.problem.numberClassRooms());
      oldTimeFrame = random.nextInt(assignment.problem.numberPeriods());
    }while(assignment.isNotAssigned(subject, oldClasRoom, oldTimeFrame));
    
    newClassRoom = random.nextInt(assignment.problem.numberClassRooms());
    newTimeFrame = random.nextInt(assignment.problem.numberPeriods());

    var newAssignment = assignment.unassign(subject, oldClasRoom, oldTimeFrame);
    newAssignment = newAssignment.assign(subject, newClassRoom, newTimeFrame);

    if(newAssignment.isValidAssignment()){
      return newAssignment;
    }
    return null;
  }
}