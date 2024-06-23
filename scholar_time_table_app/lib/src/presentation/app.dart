import 'package:flutter/material.dart';
import 'package:scholar_time_table_app/src/core/shared/domain/bloc/bloc_provider.dart';
import 'package:scholar_time_table_app/src/presentation/general_options/GeneralOptionsBloc.dart';

import '../DependenciesProvider.dart';
import 'home/home_page.dart';

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Scholar time table",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: Colors.grey[50],
      ),
      home: BlocProvider(
        key: ValueKey("generalOptionsBlocProvider"),
        bloc: getIt<GeneralOptionsBloc>(),
        child: HomePage(),)
      ,
    );
  }
}