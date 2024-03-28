import 'package:faker/faker.dart';
import '../../../../../core/instance/department/domain/Department.dart';
import '../../../../shared/infrastructure/UuidGeneratorMother.dart';

class DepartmentMother{
  static Department create(String id, String name){
    return Department.create(id, name);
  }

  static Department random(){
    return create(UuidGeneratorMother.random(), faker.company.name());
  }

  static List<Department> randomList(){
    List<Department> departments = [];
    int              total       = faker.randomGenerator.integer(10);
    int              i           = 0;
    while(i < total){
      var department = random();
      if(!departments.any((element) => element.id == department.id)){
        departments.add(department);
        i++;
      }
    }
    return departments;
  }
}