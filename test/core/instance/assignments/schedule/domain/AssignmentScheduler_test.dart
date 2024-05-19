import 'package:test/test.dart';

import '../../../../../../core/instance/assignments/schedule/domain/AssignmentScheduler.dart';
import '../../../../../../core/instance/assignments/schedule/domain/ScheduleClassRoom.dart';
import '../../../../../../core/instance/assignments/schedule/domain/ScheduleCourse.dart';
import '../../../../../../core/instance/assignments/schedule/domain/ScheduleSubject.dart';
import '../../../../../../core/instance/assignments/schedule/domain/ScheduleTeacher.dart';
import '../../../../../../core/instance/assignments/schedule/domain/ScheduleTimeFrame.dart';

void main(){
  group("Assignment Scheduler", () {
    test("Should create assignment matrix", () {
      // Arrange
      var subjects            = [ScheduleSubject("S1", [1, 1, 1]), ScheduleSubject("S2", [1, 1])];
      var teachers            = [ScheduleTeacher("T1", ["S1"]), ScheduleTeacher("T2", ["S2"])];
      var classRooms          = [ScheduleClassRoom("A1"), ScheduleClassRoom("A2")];
      var courses             = [ScheduleCourse("G1", ["S1"], 0), ScheduleCourse("G2", ["S2"], 1)];
      var timeFrames          = List.generate(40, (index) => ScheduleTimeFrame(index + 1));
      var assignmentScheduler = AssignmentScheduler.createEmpty(subjects, teachers, classRooms, courses, timeFrames);

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
      var timeFrames          = List.generate(40, (index) => ScheduleTimeFrame(index + 1));
      var assignmentScheduler = AssignmentScheduler.createEmpty(subjects, teachers, classRooms, courses, timeFrames);

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
      var timeFrames          = List.generate(40, (index) => ScheduleTimeFrame(index + 1));
      var assignmentScheduler = AssignmentScheduler.createEmpty(subjects, teachers, classRooms, courses, timeFrames);

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
      var timeFrames          = List.generate(40, (index) => ScheduleTimeFrame(index + 1));
      var assignmentScheduler = AssignmentScheduler.createEmpty(subjects, teachers, classRooms, courses, timeFrames);

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
      var timeFrames          = List.generate(40, (index) => ScheduleTimeFrame(index + 1));
      var assignmentScheduler = AssignmentScheduler.createEmpty(subjects, teachers, classRooms, courses, timeFrames);

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
      var timeFrames          = List.generate(40, (index) => ScheduleTimeFrame(index + 1));
      var assignmentScheduler = AssignmentScheduler.createEmpty(subjects, teachers, classRooms, courses, timeFrames);

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
      var timeFrames          = List.generate(40, (index) => ScheduleTimeFrame(index + 1));
      var assignmentScheduler = AssignmentScheduler.createEmpty(subjects, teachers, classRooms, courses, timeFrames);

      // Act
      var result = assignmentScheduler.assign(0, 0, 0); // Subject S1 on Time 0
      result     = result.assign(0, 0, 1); // Subject S1 on Time 1
      result     = result.assign(1, 0, 0); // Subject S2 on Time 0
      result     = result.assign(2, 0, 0); // Subject S3 on Time 0

      // Assert
      expect(result.checkCourseNotHaveSubjectsAtTheSameTime(), isFalse);
    });
  });
}