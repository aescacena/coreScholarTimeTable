import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../../../../../../core/instance/assignments/subject/application/assigner/SubjectAssigner.dart';

void main(){
  group("Service assigner", () {
    test("Should all subject and teacher assigned", () {
      // Arrange
      var subjects     = ["1", "2", "3", "4"];
      var timeSubjects = [1, 4, 4, 1];
      var teachers     = ["1", "2", "3"];

      // Act
      var assignments = SubjectAssigner.assignSubjects(subjects, timeSubjects, teachers);

      // Assert
      for(var subject in subjects){
        expect(assignments.any((actualAssignment) => actualAssignment.subjectId == subject), isTrue);
      }
      for(var teacher in teachers){
        expect(assignments.any((actualAssignment) => actualAssignment.teacherId == teacher), isTrue);
      }
    });
    test("Should some subject is not assigned", () {
      // Arrange
      var subjects     = ["1", "2", "3", "4"];
      var timeSubjects = [18, 18, 1, 18];
      var teachers     = ["1", "2", "3"];

      // Act
      var assignments = SubjectAssigner.assignSubjects(subjects, timeSubjects, teachers);

      // Assert
      expect(assignments.any((actualAssignment) => actualAssignment.subjectId == subjects[0]), isTrue);
      expect(assignments.any((actualAssignment) => actualAssignment.subjectId == subjects[1]), isTrue);
      expect(assignments.any((actualAssignment) => actualAssignment.subjectId == subjects[2]), isTrue);
      expect(assignments.any((actualAssignment) => actualAssignment.subjectId == subjects[3]), isFalse);
    });
  });
}