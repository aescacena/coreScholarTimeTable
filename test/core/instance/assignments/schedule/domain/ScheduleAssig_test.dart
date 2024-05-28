import 'package:test/test.dart';

import '../../../../../../core/instance/assignments/schedule/domain/ScheduleClassRoom.dart';
import '../../../../../../core/instance/assignments/schedule/domain/ScheduleCourse.dart';
import '../../../../../../core/instance/assignments/schedule/domain/ScheduleProblem.dart';
import '../../../../../../core/instance/assignments/schedule/domain/ScheduleSubject.dart';
import '../../../../../../core/instance/assignments/schedule/domain/ScheduleTeacher.dart';
import '../../../../../../core/instance/assignments/schedule/domain/assigner/backtracking/BacktrackingScheduleAssign.dart';
import 'ScheduleTimeFrameMother.dart';

void main(){
  group("Backtracking Scheduler Assign", () {
    test("Should create valid assignment", () {
      // Arrange
      var subjects   = [ScheduleSubject("S1", [1, 1]), ScheduleSubject("S2", [1, 1])];
      var teachers   = [ScheduleTeacher("T1", ["S1"]), ScheduleTeacher("T2", ["S2"])];
      var classRooms = [ScheduleClassRoom("A1"), ScheduleClassRoom("A2")];
      var courses    = [ScheduleCourse("G1", ["S1"], 0), ScheduleCourse("G2", ["S2"], 1)];
      var timeFrames = ScheduleTimeFrameMother.withDaysAndPeriodPerTurn(5, 4);
      var problem    = new ScheduleProblem(subjects, teachers, classRooms, courses, timeFrames);
      var assign     = new BacktrackingScheduleAssign();

      // Act
      var assignment = assign.solve(problem);

      // Assert
      expect(assignment, isNotNull);
    });
    test("Should not create valid assignment", () {
      // Arrange
      var subjects   = [ScheduleSubject("S1", [1, 1]), ScheduleSubject("S2", [1, 1])];
      var teachers   = [ScheduleTeacher("T1", ["S1"]), ScheduleTeacher("T2", ["S2"])];
      var classRooms = [ScheduleClassRoom("A1"), ScheduleClassRoom("A2")];
      var courses    = [ScheduleCourse("G1", ["S1"], 0), ScheduleCourse("G2", ["S2"], 1)];
      var timeFrames = ScheduleTimeFrameMother.withDaysAndPeriodPerTurn(1, 1);
      var problem    = new ScheduleProblem(subjects, teachers, classRooms, courses, timeFrames);
      var assign     = new BacktrackingScheduleAssign();

      // Act
      var assignment = assign.solve(problem);

      // Assert
      expect(assignment, isNull);
    });
  });
}