
import 'package:flutter_test/flutter_test.dart';
import 'package:scholar_time_table_app/core/instance/assignments/schedule/domain/ScheduleTeacher.dart';

void main(){
  group("Scheduler teacher", () {
    test("Should return true because contain subject", () {
      // Arrange
      var teacher = ScheduleTeacher("T1", ["S1", "S2", "S3"]);

      // Act

      // Assert
      expect(teacher.contains("S2"), isTrue);
    });
    test("Should return true because not contain subject", () {
      // Arrange
      var teacher = ScheduleTeacher("T1", ["S1", "S2", "S3"]);

      // Act

      // Assert
      expect(teacher.notContains("NOT_CONTAINS"), isTrue);
    });
  });
}