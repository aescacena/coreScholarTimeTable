import 'AssignmentProblem.dart';
import 'ScheduleAssignment.dart';
import 'ScheduleClassRoom.dart';
import 'ScheduleCourse.dart';
import 'ScheduleSubject.dart';
import 'ScheduleTeacher.dart';
import 'ScheduleTimeFrame.dart';

class AssignmentScheduler{
  final AssignmentProblem   problem;
  final ScheduleAssignments assignments; //[subject][classRoom][timeFrame]

  AssignmentScheduler.create(this.problem, this.assignments);

  static AssignmentScheduler createEmpty(
      List<ScheduleSubject> subjects, List<ScheduleTeacher> teachers, List<ScheduleClassRoom> classRooms,
      List<ScheduleCourse> courses, List<ScheduleTimeFrame> timeFrames){
    return AssignmentScheduler.create(
        new AssignmentProblem(subjects, teachers, classRooms, courses, timeFrames),
        ScheduleAssignments.empty(subjects.length, classRooms.length, timeFrames.length));
  }

  AssignmentScheduler assign(int subject, int classRoom, int timeFrame){
    return AssignmentScheduler.create(
        problem, assignments.assign(subject, classRoom, timeFrame));
  }

  bool isAssigned(int subject, int classRoom, int timeFrame){
    return assignments.isAssigned(subject, classRoom, timeFrame);
  }

  bool checkTeacherCanTeachOneTeachAtATime() {
    for (int teacher = 0; teacher < problem.teachers.length; teacher++) {
      var teacherSubjects = problem.teachers[teacher].subjects.map((subjectId) => problem.subjects.indexWhere((s) => s.id == subjectId)).toList();
      for (int k = 0; k < problem.timeFrames.length; k++) {
        int sum = 0;
        for (int i in teacherSubjects) {
          for (int j = 0; j < problem.classRooms.length; j++) {
            if(assignments.isAssigned(i, j, k)){
              sum++;
            }
          }
        }
        if (sum > 1) return false;
      }
    }
    return true;
  }

  bool checkSubjectIsTaughtInOneClassroomAtTheSameTime() {
    for (int j = 0; j < problem.classRooms.length; j++) {
      for (int k = 0; k < problem.timeFrames.length; k++) {
        int sum = 0;
        for (int i = 0; i < problem.subjects.length; i++) {
          if(assignments.isAssigned(i, j, k)){
            sum++;
          }
        }
        if (sum > 1) return false;
      }
    }
    return true;
  }

  bool checkCourseNotHaveSubjectsAtTheSameTime() {
    for (int q = 0; q < problem.courses.length; q++) {
      var subjectsOnCourse = problem.courses[q].subjects.map((subjectId) => problem.subjects.indexWhere((s) => s.id == subjectId)).toList();
      for (int k = 0; k < problem.timeFrames.length; k++) {
        int sum = 0;
        for (int i in subjectsOnCourse) {
          for (int j = 0; j < problem.classRooms.length; j++) {
            if(assignments.isAssigned(i, j, k)) {
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
              if(assignments.isAssigned(i, j, k)){
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

  /*
  // Restriction 5: Subjects must be scheduled in the correct turn
  bool checkGroupTurnConstraint() {
    for (int q = 0; q < groups.length; q++) {
      var E_q = groups[q].subjects.map((subjectId) => subjects.indexWhere((s) => s.id == subjectId)).toList();
      int v_q = groups[q].turn;
      for (int i in E_q) {
        for (int j = 0; j < classrooms.length; j++) {
          for (int k = 0; k < periods.length; k++) {
            if (x[i][j][k] == 1 && ((k < 20 && v_q != 0) || (k >= 20 && v_q != 1))) {
              return false;
            }
          }
        }
      }
    }
    return true;
  }
   */
}