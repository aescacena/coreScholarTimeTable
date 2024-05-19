import 'ScheduleClassRoom.dart';
import 'ScheduleCourse.dart';
import 'ScheduleSubject.dart';
import 'ScheduleTeacher.dart';
import 'ScheduleTimeFrame.dart';

class AssignmentProblem{
  final List<ScheduleSubject>   subjects;
  final List<ScheduleTeacher>   teachers;
  final List<ScheduleClassRoom> classRooms;
  final List<ScheduleCourse>    courses;
  final List<ScheduleTimeFrame> timeFrames;

  AssignmentProblem(this.subjects, this.teachers, this.classRooms, this.courses, this.timeFrames);
}