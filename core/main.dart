import 'instance/teacher/domain/Teacher.dart';

void main(){
  var teacher = Teacher.create("1", "this.name", "this.subName", 1);
  print(teacher.name);
}