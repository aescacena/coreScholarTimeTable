import '../../../../../core/instance/subjects/domain/SubjectId.dart';
import '../../../../shared/infrastructure/UuidGeneratorMother.dart';

class SubjectIdMother {
  static SubjectId create(String id){
    return new SubjectId(id);
  }

  static SubjectId random(){
    return create(UuidGeneratorMother.random());
  }
}