
abstract class CoursesState{
  CoursesState();

  factory CoursesState.loading() => LoadingCourseState();

  factory CoursesState.loaded(List<CourseState> courses) =>
      LoadedCoursesState(totalCourses: courses.length, courses: courses);

  factory CoursesState.error(String message) => ErrorCourseState(message: message);
}

class LoadingCourseState extends CoursesState{
  LoadingCourseState();
}

class LoadedCoursesState extends CoursesState{
  final int totalCourses;
  final List<CourseState> courses;
  LoadedCoursesState({required this.totalCourses, required this.courses});
}

class ErrorCourseState extends CoursesState{
  final String message;
  ErrorCourseState({required this.message});
}

class CourseState{
  final String                   name;
  final int                      numberSubjects;
  final List<CourseSubjectState> subjects;

  CourseState(this.name, this.numberSubjects, this.subjects);
}

class CourseSubjectState{
  final String id;
  final int    weeklyHours;

  CourseSubjectState(this.id, this.weeklyHours);
}