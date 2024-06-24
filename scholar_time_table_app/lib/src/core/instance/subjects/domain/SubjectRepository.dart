import 'Subject.dart';
import '../../../../../src/core/instance/subjects/domain/SubjectId.dart';

abstract class SubjectRepository{
  Future<Subject?> findById(SubjectId id);
  Future<List<Subject>> searchAll();
  void save(Subject subject);
  void delete(SubjectId id);
}