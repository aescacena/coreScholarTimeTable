import 'package:scholar_time_table_app/src/core/instance/teacher/domain/TeacherRepository.dart';

import '../Teacher.dart';

class TeacherAllSearcher{
  final TeacherRepository _repository;

  TeacherAllSearcher(this._repository);

  Future<List<Teacher>> search() async{
    return await _repository.searchAll();
  }
}