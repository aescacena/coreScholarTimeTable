
class ScheduleAssignments{
  final List<List<List>> assignments; //i -> subject, j -> classRoom, k -> timeFrame

  ScheduleAssignments._(this.assignments);

  static ScheduleAssignments empty(int totalSubjects, int totalClassRooms, int totalTimeFrames){
    return ScheduleAssignments._(
        List.generate(totalSubjects,
                (i) => List.generate(totalClassRooms,
                        (j) => List.generate(totalTimeFrames,
                                (k) => 0)))
    );
  }

  ScheduleAssignments assign(int subject, int classRoom, int timeFrame){
    var newAssignment = _copy();
    newAssignment[subject][classRoom][timeFrame] = 1;
    return ScheduleAssignments._(newAssignment);
  }

  bool isAssigned(int subject, int classRoom, int timeFrame){
    return assignments[subject][classRoom][timeFrame] == 1;
  }

  List<List<List>> _copy(){
    return assignments.map((level2) =>
        level2.map((level1) =>
        List<int>.from(level1)).toList()).toList();
  }
}