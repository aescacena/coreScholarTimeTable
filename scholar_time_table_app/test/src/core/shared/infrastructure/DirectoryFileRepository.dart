import 'dart:io';

import 'package:scholar_time_table_app/src/core/shared/domain/FileRepository.dart';

class DirectoryFileRepository implements FileRepository{
  @override
  Future<String> readJson(String name) async{
    var file = File(Directory.current.path+'/lib/src/core/resource/data/'+name+'.json');
    return file.readAsStringSync();
  }

}