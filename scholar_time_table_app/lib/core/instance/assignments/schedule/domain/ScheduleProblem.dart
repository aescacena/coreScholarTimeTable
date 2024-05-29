import 'ScheduleClassRoom.dart';
import 'ScheduleCourse.dart';
import 'ScheduleSubject.dart';
import 'ScheduleTeacher.dart';
import 'ScheduleTimeFrame.dart';

class ScheduleProblem{
  final List<ScheduleSubject>   subjects;
  final List<ScheduleTeacher>   teachers;
  final List<ScheduleClassRoom> classRooms;
  final List<ScheduleCourse>    courses;
  final List<ScheduleTimeFrame> timeFrames;

  ScheduleProblem(this.subjects, this.teachers, this.classRooms, this.courses, this.timeFrames);

  List<int> timeFrameIds(){
    List<int> ids = [];
    for(var timeFrame in timeFrames){
      if(!ids.contains(timeFrame.id)){
        ids.add(timeFrame.id);
      }
    }
    return ids;
  }

  List<int> positionPeriodsOnTimeFrame(int id){
    List<int> periods = [];
    for(int i = 0; i < this.timeFrames.length; i++){
      if(this.timeFrames[i].id == id){
        periods.add(i);
      }
    }
    return periods;
  }

  int numberCourses(){
    return this.courses.length;
  }

  int numberClassRooms(){
    return this.courses.length;
  }

  int numberPeriods(){
    return this.timeFrames.length;
  }

  int numberDays(){
    return this.timeFrames.map((e) => e.id).toSet().toList().length;
  }

  int turnFrame(int frame){
    return this.timeFrames[frame].turn;
  }

  int numberSubjects(){
    return this.subjects.length;
  }

  int numberTeacher(){
    return this.teachers.length;
  }

  List<int> positionForTeacherSubjects(int teacher){
    return teachers[teacher].subjects.map((subjectId) =>
        subjects.indexWhere((s) => s.id == subjectId)).toList();
  }

  List<int> positionForTimeFrame(int timeFrameId){
    List<int> positions = [];
    for(int i = 0; i < timeFrames.length; i++){
      if(timeFrames[i].id == timeFrameId){
        positions.add(i);
      }
    }
    return positions;
  }
}