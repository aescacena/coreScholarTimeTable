import 'ScheduleProblem.dart';

class ScheduleAssignment{
  final ScheduleProblem  problem;
  final List<List<List>> assignments; //i -> subject, j -> classRoom, k -> timeFrame

  ScheduleAssignment._(this.problem, this.assignments);

  static ScheduleAssignment empty(ScheduleProblem problem){
    return ScheduleAssignment._(
        problem, ScheduleAssignment.assignmentsEmpty(
        problem.subjects.length, problem.classRooms.length, problem.timeFrames.length));
  }

  static List<List<List>> assignmentsEmpty(int totalSubjects, int totalClassRooms, int totalTimeFrames){
    return List.generate(totalSubjects,
            (i) => List.generate(totalClassRooms,
                (j) => List.generate(totalTimeFrames,
                    (k) => 0)));
  }

  bool isAssigned(int subject, int classRoom, int timeFrame){
    return assignments[subject][classRoom][timeFrame] == 1;
  }

  List<List<List>> _copy(){
    return assignments.map((level2) =>
        level2.map((level1) =>
        List<int>.from(level1)).toList()).toList();
  }

  ScheduleAssignment assign(int subject, int classRoom, int timeFrame){
    var newAssignment = _copy();
    newAssignment[subject][classRoom][timeFrame] = 1;
    return ScheduleAssignment._(this.problem, newAssignment);
  }

  // Restriction 1: A teacher can only teach one subject at a time
  bool checkTeacherCanTeachOneTeachAtATime() {
    for (int teacher = 0; teacher < problem.teachers.length; teacher++) {
      var teacherSubjects = problem.teachers[teacher].subjects.map((subjectId) => problem.subjects.indexWhere((s) => s.id == subjectId)).toList();
      for (int k = 0; k < problem.timeFrames.length; k++) {
        int sum = 0;
        for (int i in teacherSubjects) {
          for (int j = 0; j < problem.classRooms.length; j++) {
            if(isAssigned(i, j, k)){
              sum++;
            }
          }
        }
        if (sum > 1) return false;
      }
    }
    return true;
  }

  // Restriction 2: Only one subject can be taught in a classroom at the same time
  bool checkSubjectIsTaughtInOneClassroomAtTheSameTime() {
    for (int j = 0; j < problem.classRooms.length; j++) {
      for (int k = 0; k < problem.timeFrames.length; k++) {
        int sum = 0;
        for (int i = 0; i < problem.subjects.length; i++) {
          if(isAssigned(i, j, k)){
            sum++;
          }
        }
        if (sum > 1) return false;
      }
    }
    return true;
  }

  // Restriction 3: Subjects for the same course cannot overlap
  bool checkCourseNotHaveSubjectsAtTheSameTime() {
    for (int q = 0; q < problem.courses.length; q++) {
      var subjectsOnCourse = problem.courses[q].subjects.map((subjectId) => problem.subjects.indexWhere((s) => s.id == subjectId)).toList();
      for (int k = 0; k < problem.timeFrames.length; k++) {
        int sum = 0;
        for (int i in subjectsOnCourse) {
          for (int j = 0; j < problem.classRooms.length; j++) {
            if(isAssigned(i, j, k)) {
              sum++;
            }
          }
        }
        if (sum > 1) return false;
      }
    }
    return true;
  }

  // Restriction 4: Each subject must be scheduled the required number of times
  bool checkSubjectSessionsConstraint() {
    for (int i = 0; i < problem.subjects.length; i++) {
      int sum = 0;
      for (int j = 0; j < problem.classRooms.length; j++) {
        for(var timeFrameId in problem.timeFrameIds()){
          for (int k = 0; k < problem.timeFrames.length; k++) {
            if(problem.timeFrames[k].id == timeFrameId){
              if(isAssigned(i, j, k)){
                sum++;
              }
            }
          }
        }
      }
      if (sum != problem.subjects[i].totalSessions()) return false;
    }
    return true;
  }

  // Restriction 5: Subjects must be scheduled in the correct turn
  bool checkGroupTurnConstraint() {
    for (int q = 0; q < problem.numberCourses(); q++) {
      //var subjectsOnCourse = problem.courses[q].subjects.map((subjectId) => problem.subjects.indexWhere((s) => s.id == subjectId)).toList();
      var subjectsOnCourse = problem.courses[q].subjects.map((subjectId) => problem.subjects.indexWhere((s) => s.id == subjectId)).toList();
      int turn = problem.courses[q].turn;
      for (int i in subjectsOnCourse) {
        for (int j = 0; j < problem.numberClassRooms(); j++) {
          for (int k = 0; k < problem.numberTimeFrames(); k++) {
            if (isAssigned(i, j, k) && (problem.turnFrame(k) != turn)) {
              return false;
            }
          }
        }
      }
    }
    return true;
  }

  bool passesAllRestrictions(){
    return this.checkTeacherCanTeachOneTeachAtATime()
        && this.checkSubjectIsTaughtInOneClassroomAtTheSameTime()
        && this.checkCourseNotHaveSubjectsAtTheSameTime()
        && this.checkSubjectSessionsConstraint()
        && this.checkGroupTurnConstraint();
  }

  bool isValidAssignment(){
    return this.checkTeacherCanTeachOneTeachAtATime()
        && this.checkSubjectIsTaughtInOneClassroomAtTheSameTime()
        && this.checkCourseNotHaveSubjectsAtTheSameTime()
        && this.checkGroupTurnConstraint();
  }
}