import 'package:flutter/services.dart';
import 'package:scholar_time_table_app/src/core/shared/domain/FileRepository.dart';

class RootBundleFileRepository implements FileRepository{
  @override
  Future<String> readJson(String name) async{
    return await rootBundle.loadString('lib/src/core/resource/data/'+name+'.json');

  }

}