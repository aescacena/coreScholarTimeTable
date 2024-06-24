
import 'package:get_it/get_it.dart';
import 'package:scholar_time_table_app/src/core/instance/course/domain/CourseRepository.dart';
import 'package:scholar_time_table_app/src/core/instance/course/domain/use_cases/CourseAllSearcher.dart';
import 'package:scholar_time_table_app/src/core/instance/course/infrastructure/InMemoryCourseRepository.dart';
import 'package:scholar_time_table_app/src/core/instance/department/infrastructure/InMemoryDepartmentRepository.dart';
import 'package:scholar_time_table_app/src/core/instance/subjects/infrastructure/InMemorySubjectRepository.dart';
import 'package:scholar_time_table_app/src/core/instance/teacher/domain/use_cases/TeacherAllSearcher.dart';
import 'package:scholar_time_table_app/src/core/instance/teacher/infrastructure/InMemoryTeacherRepository.dart';
import 'package:scholar_time_table_app/src/core/shared/domain/FileRepository.dart';
import 'package:scholar_time_table_app/src/core/shared/infrastructure/RootBundleFileRepository.dart';
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

  getIt.registerLazySingleton<CourseRepository>(() => InMemoryCourseRepository.create(getIt()));
}

registerGeneralOptionsDependencies(){
  getIt.registerFactory(() => GeneralOptionsBloc());
}

registerTimeTableDependencies(){
  getIt.registerFactory(() => TimeTableBloc());
}

registerTeachersDependencies(){
  getIt.registerLazySingleton(() => TeacherAllSearcher(getIt()));
  getIt.registerLazySingletonAsync(() => InMemoryTeacherRepository.create(getIt()));
}

registerSubjectsDependencies(){
  getIt.registerLazySingletonAsync(() => InMemorySubjectRepository.create(getIt()));
}

registerDepartmentsDependencies(){
  getIt.registerLazySingletonAsync(() => InMemoryDepartmentRepository.create(getIt()));
}

registerSharedDependencies(){
  getIt.registerLazySingleton<FileRepository>(() => RootBundleFileRepository());
}