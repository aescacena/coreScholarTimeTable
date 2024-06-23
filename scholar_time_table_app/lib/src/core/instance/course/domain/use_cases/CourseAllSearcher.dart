import 'package:scholar_time_table_app/src/core/instance/course/domain/Course.dart';
import 'package:scholar_time_table_app/src/core/instance/course/domain/CourseRepository.dart';

class CourseAllSearcher{
  final CourseRepository _repository;

  CourseAllSearcher(this._repository);

  Future<List<Course>> search() async{
    return _repository.searchAll();
  }
}