import '../../ScheduleAssignment.dart';
import '../../ScheduleProblem.dart';
import '../ScheduleAssigner.dart';

class BacktrackingScheduleAssign implements ScheduleAssign{

  ScheduleAssignment? solve(ScheduleProblem problem) {
    var initialAssignment = ScheduleAssignment.empty(problem);
    var solved = _solveRecursively(initialAssignment, 0, 0);
    return solved ? initialAssignment : null;
  }

  bool _solveRecursively(ScheduleAssignment assignment, int subjectIndex, int sessionCount) {
    if(subjectIndex == assignment.problem.numberSubjects()){
      return assignment.passesAllRestrictions();
    }

    var subject         = assignment.problem.subjects[subjectIndex];
    var sessionRequired = subject.sessions.length;

    for(var classRoom = 0; classRoom < assignment.problem.classRooms.length; classRoom++){
      for(var timeFrame = 0; timeFrame < assignment.problem.timeFrames.length; timeFrame++){
        if(isValidAssignment(assignment, subjectIndex, classRoom, timeFrame)){
          var newAssignment = assignment.assign(subjectIndex, classRoom, timeFrame);
          sessionCount++;

          if(sessionCount == sessionRequired){
            if(_solveRecursively(newAssignment, subjectIndex + 1, 0)){
              assignment.assignments[subjectIndex][classRoom][timeFrame] = 1;
              return true;
            }
          }else{
            if(_solveRecursively(newAssignment, subjectIndex, sessionCount)){
              assignment.assignments[subjectIndex][classRoom][timeFrame] = 1;
              return true;
            }
          }
          sessionCount--;
        }
      }
    }
    return false;
  }

  bool isValidAssignment(ScheduleAssignment assignment, int subjectIndex, int classRoom, int timeFrame) {
    var newAssignment = assignment.assign(subjectIndex, classRoom, timeFrame);
    return newAssignment.isValidAssignment();
  }
}