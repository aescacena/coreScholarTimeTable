import 'Subject.dart';
import 'SubjectId.dart';

abstract class SubjectRepository{
  Subject? findById(SubjectId id);
  List<Subject> searchAll();
  void save(Subject subject);
  void delete(SubjectId id);
}