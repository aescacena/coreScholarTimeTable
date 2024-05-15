import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../../../../../core/instance/assigments/subject/application/SubjectAssigner.dart';

void main(){
  group("Service assigner", () {
    test("Should any subject assigned", () {
      // Arrange
      var subjects     = ["1", "2", "3", "4"];
      var timeSubjects = ["5", "9", "4", "2"];
      var teachers     = ["1", "2"];

      // Act
      SubjectAssigner assigner = new SubjectAssigner(subjects, timeSubjects, teachers);

      // Assert
      for(var i = 0; i < subjects.length; i++){
        expect(assigner.subjectNotAssigned(i), isFalse);
      }
    });
    test("Should subject is assigned", () {
      // Arrange
      var subjects        = ["1", "2", "3", "4"];
      var timeSubjects    = ["5", "9", "4", "2"];
      var teachers        = ["1", "2"];
      var assigner        = new SubjectAssigner(subjects, timeSubjects, teachers);
      var subjectSelected = 2;
      var teacherSelected = 1;

      // Act
      assigner.assign(subjectSelected, teacherSelected);

      // Assert
      expect(assigner.subjectNotAssigned(subjectSelected), isTrue);
    });

    test("Should subject is assigned", () {
      // Arrange
      var subjects        = ["1", "2", "3", "4"];
      var timeSubjects    = ["5", "9", "4", "2"];
      var teachers        = ["1", "2"];
      var assigner        = new SubjectAssigner(subjects, timeSubjects, teachers);
      var teacherSelected = 1;
      var teacherExpect   = 0;

      // Act
      assigner.assign(0, teacherSelected);
      assigner.assign(1, teacherSelected);
      assigner.assign(3, teacherSelected);

      // Assert
      expect(assigner.selectBestTeacher(), teacherExpect);
    });
  });
}