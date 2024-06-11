import 'package:scholar_time_table_app/src/core/instance/subjects/domain/SubjectId.dart';

import '../../../../../src/core/shared/infrastructure/UuidGeneratorMother.dart';

class SubjectIdMother {
  static SubjectId create(String id){
    return new SubjectId(id);
  }

  static SubjectId random(){
    return create(UuidGeneratorMother.random());
  }
}