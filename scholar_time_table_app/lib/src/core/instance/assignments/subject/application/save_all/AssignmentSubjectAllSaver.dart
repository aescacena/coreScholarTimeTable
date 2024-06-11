import '../../../../../../../src/core/instance/assignments/subject/domain/AssignmentSubject.dart';
import '../../domain/AssignmentSubjectRepository.dart';

class AssignmentSubjectAllSaver{
  final AssignmentSubjectRepository repository;

  AssignmentSubjectAllSaver(this.repository);

  void save(List<AssignmentSubject> assignments){
    repository.saveALl(assignments);
  }
}