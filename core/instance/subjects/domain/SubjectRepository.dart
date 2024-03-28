import 'Subject.dart';

abstract class SubjectRepository{
  Subject? findById(String id);
  List<Subject> searchAll();
  void save(Subject subject);
  void delete(String id);
}