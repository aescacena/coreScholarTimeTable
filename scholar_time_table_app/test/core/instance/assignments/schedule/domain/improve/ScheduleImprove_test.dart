import 'package:flutter_test/flutter_test.dart';
import 'package:scholar_time_table_app/core/instance/assignments/schedule/domain/ScheduleAssignment.dart';
import 'package:scholar_time_table_app/core/instance/assignments/schedule/domain/ScheduleClassRoom.dart';
import 'package:scholar_time_table_app/core/instance/assignments/schedule/domain/ScheduleCourse.dart';
import 'package:scholar_time_table_app/core/instance/assignments/schedule/domain/ScheduleProblem.dart';
import 'package:scholar_time_table_app/core/instance/assignments/schedule/domain/ScheduleSubject.dart';
import 'package:scholar_time_table_app/core/instance/assignments/schedule/domain/ScheduleTeacher.dart';
import 'package:scholar_time_table_app/core/instance/assignments/schedule/domain/improve/simulatedAnnealing/SimulatedAnnealingScheduleImprove.dart';

import '../ScheduleTimeFrameMother.dart';

void main(){
  group("Simulated Annealing algorithm", () {
    test("Should improve with 0 gaps", () {
      // Arrange
      var subjects            = [ScheduleSubject("S1", [1, 1]), ScheduleSubject("S2", [1]), ScheduleSubject("S3", [1]), ScheduleSubject("S4", [1])];
      var teachers            = [ScheduleTeacher("T1", ["S1", "S2"]), ScheduleTeacher("T2", ["S3", "S4"])];
      var classRooms          = [ScheduleClassRoom("A1"), ScheduleClassRoom("A2")];
      var courses             = [ScheduleCourse("G1", ["S1", "S2"], 0), ScheduleCourse("G2", ["S3", "S4"], 1)];
      var timeFrames          = ScheduleTimeFrameMother.withDaysAndPeriodPerTurn(2, 4);
      var assignmentScheduler = ScheduleAssignment.empty(new ScheduleProblem(subjects, teachers, classRooms, courses, timeFrames));
      var initialAssignment   = assignmentScheduler.assign(0, 0, 0);
      initialAssignment       = initialAssignment.assign(0, 1, 3);
      initialAssignment       = initialAssignment.assign(1, 0, 7);
      initialAssignment       = initialAssignment.assign(2, 1, 5);
      initialAssignment       = initialAssignment.assign(3, 0, 7);
      var improver            = SimulatedAnnealingScheduleImprove.create(initialAssignment);

      // Act
      var result = improver.improve();

      // Assert
      expect(initialAssignment.countTeacherGaps(), 6);
      expect(result, isNotNull);
      expect(result?.countTeacherGaps(), isZero);
    });
  });
}