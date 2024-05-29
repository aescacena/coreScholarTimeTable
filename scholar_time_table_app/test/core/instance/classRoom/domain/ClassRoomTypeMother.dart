import 'dart:math';

import 'package:faker/faker.dart';
import 'package:scholar_time_table_app/core/instance/classRoom/domain/ClassRoomType.dart';

class ClassRoomTypeMother{
  static ClassRoomType random(){
    var values      = ClassRoomType.values;
    var random      = Random();
    var randomIndex = random.nextInt(values.length);
    return values[randomIndex];
  }

  static List<ClassRoomType> randomList(){
    List<ClassRoomType> types = [];
    int          total        = faker.randomGenerator.integer(ClassRoomType.values.length);
    int          i            = 0;
    while(i < total){
      var type = random();
      if(!types.any((element) => element == type)){
        types.add(type);
        i++;
      }
    }
    return types;
  }
}