import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../../../../../core/instance/assignments/subject/application/SubjectAssigner.dart';

void main(){
  group("Service assigner", () {
    test("Should all subject and teacher assigned", () {
      // Arrange
      var subjects     = ["1", "2", "3", "4"];
      var timeSubjects = [1, 4, 4, 1];
      var teachers     = ["1", "2", "3"];

      // Act
      var assigner = SubjectAssigner.assignSubjects(subjects, timeSubjects, teachers);

      // Assert
      for(var i = 0; i < subjects.length; i++){
        expect(assigner.isSubjectAssigned(i), isTrue);
      }
      for(var i = 0; i < teachers.length; i++){
        expect(assigner.isTeacherAssigned(i), isTrue);
      }
    });
    test("Should some subject is not assigned", () {
      // Arrange
      var subjects     = ["1", "2", "3", "4"];
      var timeSubjects = [18, 18, 1, 18];
      var teachers     = ["1", "2", "3"];

      // Act
      var assigner = SubjectAssigner.assignSubjects(subjects, timeSubjects, teachers);

      // Assert
      expect(assigner.isSubjectAssigned(0), isTrue);
      expect(assigner.isSubjectAssigned(1), isTrue);
      expect(assigner.isSubjectAssigned(2), isTrue);
      expect(assigner.isSubjectNotAssigned(3), isTrue);
      for(var i = 0; i < teachers.length; i++){
        expect(assigner.isTeacherAssigned(i), isTrue);
      }
    });
  });
}