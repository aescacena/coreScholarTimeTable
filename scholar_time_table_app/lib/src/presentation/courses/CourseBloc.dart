import 'package:scholar_time_table_app/src/presentation/courses/CourseState.dart';

import '../../core/instance/course/domain/Course.dart';
import '../../core/instance/course/domain/use_cases/CourseAllSearcher.dart';
import '../../core/shared/domain/bloc/bloc.dart';

class CourseBloc extends Bloc<CoursesState>{
  final CourseAllSearcher _allSearcher;

  CourseBloc(this._allSearcher){
    _init();
  }

  Future<void> _init() async{
    changeState(CoursesState.loading());
    var courses = await _allSearcher.search();
    changeState(_toState(courses));
  }

  CoursesState _toState(List<Course> courses) {
    var coursesState = courses.map((course) =>
        CourseState(
            course.name,
            course.numberSubjects(),
            course.subjects.map((subject) =>
                CourseSubjectState(subject.subjectId, subject.weeklyHours))
                .toList()))
        .toList();
    return CoursesState.loaded(coursesState);
  }
  
}