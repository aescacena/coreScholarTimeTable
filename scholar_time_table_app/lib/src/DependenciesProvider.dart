
import 'package:get_it/get_it.dart';
import 'package:scholar_time_table_app/src/core/instance/course/domain/CourseRepository.dart';
import 'package:scholar_time_table_app/src/core/instance/course/domain/use_cases/CourseAllSearcher.dart';
import 'package:scholar_time_table_app/src/core/instance/course/infrastructure/InMemoryCourseRepository.dart';
import 'package:scholar_time_table_app/src/presentation/courses/CourseBloc.dart';
import 'package:scholar_time_table_app/src/presentation/general_options/GeneralOptionsBloc.dart';
import 'package:scholar_time_table_app/src/presentation/timetable/TimeTableBloc.dart';

final getIt = GetIt.instance;

void init(){
  registerCourseDependencies();
  registerGeneralOptionsDependencies();
  registerTimeTableDependencies();
}

registerCourseDependencies(){
  getIt.registerFactory(() => CourseBloc(getIt()));

  getIt.registerLazySingleton(() => CourseAllSearcher(getIt()));

  getIt.registerLazySingleton<CourseRepository>(() => InMemoryCourseRepository.empty());
}

registerGeneralOptionsDependencies(){
  getIt.registerFactory(() => GeneralOptionsBloc());
}

registerTimeTableDependencies(){
  getIt.registerFactory(() => TimeTableBloc());
}