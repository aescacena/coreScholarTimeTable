import '../../../../../../src/core/instance/assignments/subject/domain/AssignmentSubject.dart';

abstract class AssignmentSubjectRepository{
  List<AssignmentSubject> searchAll();
  void saveALl(List<AssignmentSubject> assignments);
}