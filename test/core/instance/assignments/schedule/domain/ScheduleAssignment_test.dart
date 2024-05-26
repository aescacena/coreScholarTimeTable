import 'package:test/test.dart';

import '../../../../../../core/instance/assignments/schedule/domain/ScheduleProblem.dart';
import '../../../../../../core/instance/assignments/schedule/domain/ScheduleAssignment.dart';
import '../../../../../../core/instance/assignments/schedule/domain/ScheduleClassRoom.dart';
import '../../../../../../core/instance/assignments/schedule/domain/ScheduleCourse.dart';
import '../../../../../../core/instance/assignments/schedule/domain/ScheduleSubject.dart';
import '../../../../../../core/instance/assignments/schedule/domain/ScheduleTeacher.dart';
import 'ScheduleTimeFrameMother.dart';

void main(){
  group("Assignment Scheduler", () {
    test("Should create assignment matrix", () {
      // Arrange
      var subjects            = [ScheduleSubject("S1", [1, 1, 1]), ScheduleSubject("S2", [1, 1])];
      var teachers            = [ScheduleTeacher("T1", ["S1"]), ScheduleTeacher("T2", ["S2"])];
      var classRooms          = [ScheduleClassRoom("A1"), ScheduleClassRoom("A2")];
      var courses             = [ScheduleCourse("G1", ["S1"], 0), ScheduleCourse("G2", ["S2"], 1)];
      var timeFrames          = ScheduleTimeFrameMother.withPeriodPerTurn(5, 4);
      var assignmentScheduler = ScheduleAssignment.empty(new ScheduleProblem(subjects, teachers, classRooms, courses, timeFrames));

      // Act
      var result = assignmentScheduler.assign(0, 0, 0);

      // Assert
      expect(result.isAssigned(0, 0, 0), isTrue);
    });
    test("Should all subjects are assigned", () {
      // Arrange
      var subjects            = [ScheduleSubject("S1", [1, 1, 1]), ScheduleSubject("S2", [1, 1])];
      var teachers            = [ScheduleTeacher("T1", ["S1"]), ScheduleTeacher("T2", ["S2"])];
      var classRooms          = [ScheduleClassRoom("A1"), ScheduleClassRoom("A2")];
      var courses             = [ScheduleCourse("G1", ["S1"], 0), ScheduleCourse("G2", ["S2"], 1)];
      var timeFrames          = ScheduleTimeFrameMother.withPeriodPerTurn(5, 4);
      var assignmentScheduler = ScheduleAssignment.empty(new ScheduleProblem(subjects, teachers, classRooms, courses, timeFrames));

      // Act
      var result = assignmentScheduler.assign(0, 0, 0);

      // Assert
      expect(result.isAssigned(0, 0, 0), isTrue);
    });
  });
  group("Check Teacher restrictions", (){
    test("Should return true because all teacher teach only one subject at the same time", (){
      // Arrange
      var subjects            = [ScheduleSubject("S1", [1, 1, 1]), ScheduleSubject("S2", [1, 1])];
      var teachers            = [ScheduleTeacher("T1", ["S1"]), ScheduleTeacher("T2", ["S2"])];
      var classRooms          = [ScheduleClassRoom("A1"), ScheduleClassRoom("A2")];
      var courses             = [ScheduleCourse("G1", ["S1"], 0), ScheduleCourse("G2", ["S2"], 1)];
      var timeFrames          = ScheduleTimeFrameMother.withPeriodPerTurn(5, 4);
      var assignmentScheduler = ScheduleAssignment.empty(new ScheduleProblem(subjects, teachers, classRooms, courses, timeFrames));

      // Act
      var result = assignmentScheduler.assign(0, 0, 0);
      result     = result.assign(0, 0, 2);
      result     = result.assign(0, 0, 4);
      result     = result.assign(0, 0, 5);

      // Assert
      expect(result.checkTeacherCanTeachOneTeachAtATime(), isTrue);
    });
    test("Should return false because some teacher teach two or more subjects at the same time", (){
      // Arrange
      var subjects            = [ScheduleSubject("S1", [1, 1, 1]), ScheduleSubject("S2", [1, 1])];
      var teachers            = [ScheduleTeacher("T1", ["S1"]), ScheduleTeacher("T2", ["S2"])];
      var classRooms          = [ScheduleClassRoom("A1"), ScheduleClassRoom("A2")];
      var courses             = [ScheduleCourse("G1", ["S1"], 0), ScheduleCourse("G2", ["S2"], 1)];
      var timeFrames          = ScheduleTimeFrameMother.withPeriodPerTurn(5, 4);
      var assignmentScheduler = ScheduleAssignment.empty(new ScheduleProblem(subjects, teachers, classRooms, courses, timeFrames));

      // Act
      var result = assignmentScheduler.assign(0, 0, 0);
      result     = result.assign(0, 1, 0);

      // Assert
      expect(result.checkTeacherCanTeachOneTeachAtATime(), isFalse);
    });
  });
  group("Check ClassRooms restrictions", (){
    test("Should return true because on all ClassRooms only one subject is taught at a time", (){
      // Arrange
      var subjects            = [ScheduleSubject("S1", [1, 1, 1]), ScheduleSubject("S2", [1, 1])];
      var teachers            = [ScheduleTeacher("T1", ["S1"]), ScheduleTeacher("T2", ["S2"])];
      var classRooms          = [ScheduleClassRoom("A1"), ScheduleClassRoom("A2")];
      var courses             = [ScheduleCourse("G1", ["S1"], 0), ScheduleCourse("G2", ["S2"], 1)];
      var timeFrames          = ScheduleTimeFrameMother.withPeriodPerTurn(5, 4);
      var assignmentScheduler = ScheduleAssignment.empty(new ScheduleProblem(subjects, teachers, classRooms, courses, timeFrames));

      // Act
      var result = assignmentScheduler.assign(0, 0, 0);
      result     = result.assign(0, 0, 2);
      result     = result.assign(0, 0, 4);
      result     = result.assign(0, 0, 5);

      // Assert
      expect(result.checkSubjectIsTaughtInOneClassroomAtTheSameTime(), isTrue);
    });
    test("Should return false because some subject is taught in the same ClassRooms at the same time", (){
      // Arrange
      var subjects            = [ScheduleSubject("S1", [1, 1, 1]), ScheduleSubject("S2", [1, 1])];
      var teachers            = [ScheduleTeacher("T1", ["S1"]), ScheduleTeacher("T2", ["S2"])];
      var classRooms          = [ScheduleClassRoom("A1"), ScheduleClassRoom("A2")];
      var courses             = [ScheduleCourse("G1", ["S1"], 0), ScheduleCourse("G2", ["S2"], 1)];
      var timeFrames          = ScheduleTimeFrameMother.withPeriodPerTurn(5, 4);
      var assignmentScheduler = ScheduleAssignment.empty(new ScheduleProblem(subjects, teachers, classRooms, courses, timeFrames));

      // Act
      var result = assignmentScheduler.assign(0, 0, 0);
      result     = result.assign(1, 0, 0);

      // Assert
      expect(result.checkSubjectIsTaughtInOneClassroomAtTheSameTime(), isFalse);
    });
  });
  group("Check Course restrictions", (){
    test("Should return true because course subjects not scheduled at the same time", (){
      // Arrange
      var subjects            = [ScheduleSubject("S1", [1, 1, 1]), ScheduleSubject("S2", [1, 1]), ScheduleSubject("S3", [1, 1])];
      var teachers            = [ScheduleTeacher("T1", ["S1"]), ScheduleTeacher("T2", ["S2"])];
      var classRooms          = [ScheduleClassRoom("A1"), ScheduleClassRoom("A2")];
      var courses             = [ScheduleCourse("G1", ["S1", "S2"], 0), ScheduleCourse("G2", ["S3"], 1)];
      var timeFrames          = ScheduleTimeFrameMother.withPeriodPerTurn(5, 4);
      var assignmentScheduler = ScheduleAssignment.empty(new ScheduleProblem(subjects, teachers, classRooms, courses, timeFrames));

      // Act
      var result = assignmentScheduler.assign(0, 0, 0); // Subject S1 on Time 0
      result     = result.assign(0, 0, 1); // Subject S1 on Time 1
      result     = result.assign(1, 0, 2); // Subject S2 on Time 2
      result     = result.assign(2, 0, 0); // Subject S3 on Time 0

      // Assert
      expect(result.checkCourseNotHaveSubjectsAtTheSameTime(), isTrue);
    });
    test("Should return false because some subjects is scheduled at the same time", (){
      // Arrange
      var subjects            = [ScheduleSubject("S1", [1, 1, 1]), ScheduleSubject("S2", [1, 1]), ScheduleSubject("S3", [1, 1])];
      var teachers            = [ScheduleTeacher("T1", ["S1"]), ScheduleTeacher("T2", ["S2"])];
      var classRooms          = [ScheduleClassRoom("A1"), ScheduleClassRoom("A2")];
      var courses             = [ScheduleCourse("G1", ["S1", "S2"], 0), ScheduleCourse("G2", ["S3"], 1)];
      var timeFrames          = ScheduleTimeFrameMother.withPeriodPerTurn(5, 4);
      var assignmentScheduler = ScheduleAssignment.empty(new ScheduleProblem(subjects, teachers, classRooms, courses, timeFrames));

      // Act
      var result = assignmentScheduler.assign(0, 0, 0); // Subject S1 on Time 0
      result     = result.assign(0, 0, 1); // Subject S1 on Time 1
      result     = result.assign(1, 0, 0); // Subject S2 on Time 0
      result     = result.assign(2, 0, 0); // Subject S3 on Time 0

      // Assert
      expect(result.checkCourseNotHaveSubjectsAtTheSameTime(), isFalse);
    });
  });
  group("Check Subject sessions restrictions", (){
    test("Should return true because all subject sessions is scheduled and in different days", (){
      // Arrange
      var subjects            = [ScheduleSubject("S1", [1, 1]), ScheduleSubject("S2", [1, 1])];
      var teachers            = [ScheduleTeacher("T1", ["S1"]), ScheduleTeacher("T2", ["S2"])];
      var classRooms          = [ScheduleClassRoom("A1"), ScheduleClassRoom("A2")];
      var courses             = [ScheduleCourse("G1", ["S1", "S2"], 0)];
      var timeFrames          = ScheduleTimeFrameMother.withPeriodPerTurn(2, 2);
      var assignmentScheduler = ScheduleAssignment.empty(new ScheduleProblem(subjects, teachers, classRooms, courses, timeFrames));

      // Act
      var result = assignmentScheduler.assign(0, 0, 0); // Subject S1 on Time 0 (Day 1)
      result     = result.assign(0, 0, 5); // Subject S1 on Time 9 (Day 2)
      result     = result.assign(1, 1, 0); // Subject S2 on Time 0 (Day 1)
      result     = result.assign(1, 1, 5); // Subject S3 on Time 9 (Day 2)

      // Assert
      expect(result.checkSubjectSessionsConstraint(), isTrue);
    });
    test("Should return false because some subject contains scheduled sessions on same day", (){
      // Arrange
      var subjects            = [ScheduleSubject("S1", [1, 1, 1]), ScheduleSubject("S2", [1, 1]), ScheduleSubject("S3", [1, 1])];
      var teachers            = [ScheduleTeacher("T1", ["S1"]), ScheduleTeacher("T2", ["S2"])];
      var classRooms          = [ScheduleClassRoom("A1"), ScheduleClassRoom("A2")];
      var courses             = [ScheduleCourse("G1", ["S1", "S2"], 0), ScheduleCourse("G2", ["S3"], 1)];
      var timeFrames          = ScheduleTimeFrameMother.withPeriodPerTurn(2, 2);
      var assignmentScheduler = ScheduleAssignment.empty(new ScheduleProblem(subjects, teachers, classRooms, courses, timeFrames));

      // Act
      var result = assignmentScheduler.assign(0, 0, 0); // Subject S1 on Time 0 (Day 1)
      result     = result.assign(0, 0, 5); // Subject S1 on Time 9 (Day 2)
      result     = result.assign(1, 1, 0); // Subject S2 on Time 0 (Day 1)
      result     = result.assign(1, 1, 2); // Subject S3 on Time 9 (Day 2)

      // Assert
      expect(result.checkSubjectSessionsConstraint(), isFalse);
    });
    test("Should return false because some session subject is not scheduled", (){
      // Arrange
      var subjects            = [ScheduleSubject("S1", [1, 1]), ScheduleSubject("S2", [1, 1])];
      var teachers            = [ScheduleTeacher("T1", ["S1"]), ScheduleTeacher("T2", ["S2"])];
      var classRooms          = [ScheduleClassRoom("A1"), ScheduleClassRoom("A2")];
      var courses             = [ScheduleCourse("G1", ["S1", "S2"], 0), ScheduleCourse("G2", ["S3"], 1)];
      var timeFrames          = ScheduleTimeFrameMother.withPeriodPerTurn(2, 2);
      var assignmentScheduler = ScheduleAssignment.empty(new ScheduleProblem(subjects, teachers, classRooms, courses, timeFrames));

      // Act
      var result = assignmentScheduler.assign(0, 0, 0); // Subject S1 on Time 0 (Day 1)
      result     = result.assign(0, 0, 5); // Subject S1 on Time 9 (Day 2)
      result     = result.assign(1, 1, 0); // Subject S2 on Time 0 (Day 1)

      // Assert
      expect(result.checkSubjectSessionsConstraint(), isFalse);
    });
  });
  group("Check Turns restrictions", (){
    test("Should return true because all subject sessions is scheduled in her turn", (){
      // Arrange
      var subjects            = [ScheduleSubject("S1", [1, 1]), ScheduleSubject("S2", [1, 1])];
      var teachers            = [ScheduleTeacher("T1", ["S1"]), ScheduleTeacher("T2", ["S2"])];
      var classRooms          = [ScheduleClassRoom("A1"), ScheduleClassRoom("A2")];
      var courses             = [ScheduleCourse("G1", ["S1", "S2"], 0)];
      var timeFrames          = ScheduleTimeFrameMother.withPeriodPerTurn(2, 2);
      var assignmentScheduler = ScheduleAssignment.empty(new ScheduleProblem(subjects, teachers, classRooms, courses, timeFrames));

      // Act
      var result = assignmentScheduler.assign(0, 0, 0); // Subject S1 on first turn(Day 1)
      result     = result.assign(0, 0, 5); // Subject S1 on first turn (Day 2)
      result     = result.assign(1, 1, 0); // Subject S2 on first turn (Day 1)
      result     = result.assign(1, 1, 5); // Subject S3 on first turn (Day 2)

      // Assert
      expect(result.checkGroupTurnConstraint(), isTrue);
    });
    test("Should return false because some subject sessions is scheduled in error turn", (){
      // Arrange
      var subjects            = [ScheduleSubject("S1", [1, 1]), ScheduleSubject("S2", [1, 1])];
      var teachers            = [ScheduleTeacher("T1", ["S1"]), ScheduleTeacher("T2", ["S2"])];
      var classRooms          = [ScheduleClassRoom("A1"), ScheduleClassRoom("A2")];
      var courses             = [ScheduleCourse("G1", ["S1", "S2"], 0)];
      var timeFrames          = ScheduleTimeFrameMother.withPeriodPerTurn(2, 2);
      var assignmentScheduler = ScheduleAssignment.empty(new ScheduleProblem(subjects, teachers, classRooms, courses, timeFrames));

      // Act
      var result = assignmentScheduler.assign(0, 0, 0); // Subject S1 on first turn(Day 1)
      result     = result.assign(1, 0, 6); // Subject S1 on second turn (Day 2)

      // Assert
      expect(result.checkGroupTurnConstraint(), isFalse);
    });
  });
}