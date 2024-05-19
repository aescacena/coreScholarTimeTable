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
}