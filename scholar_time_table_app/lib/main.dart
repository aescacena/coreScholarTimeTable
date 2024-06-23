import 'package:flutter/material.dart';
import 'package:scholar_time_table_app/src/DependenciesProvider.dart' as di;
import 'package:scholar_time_table_app/src/presentation/app.dart';

void main(){
  di.init();
  runApp(App());
}
