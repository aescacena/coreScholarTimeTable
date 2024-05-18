import 'package:test/scaffolding.dart';

import '../../../../../../../core/instance/assignments/subject/application/save_all/AssignmentSubjectAllSaver.dart';
import '../../../../../../../core/instance/assignments/subject/infrastructure/InMemoryAssignmentSubjectRepository.dart';
import '../../domain/AssignmentSubjectMother.dart';

void main(){

  late AssignmentSubjectAllSaver saver;

  setUp((){
    saver = new AssignmentSubjectAllSaver(InMemoryAssignmentSubjectRepository.empty());
  });

  group("Save all service", () {
    test("Should save all", () {
      // Arrange
      var assignments = AssignmentSubjectMother.randomList();

      // Act
      saver.save(assignments);

      // Assert

    });
  });
}