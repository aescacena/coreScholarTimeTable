import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scholar_time_table_app/src/core/shared/domain/bloc/bloc_provider.dart';
import 'package:scholar_time_table_app/src/presentation/courses/CourseBloc.dart';
import 'package:scholar_time_table_app/src/presentation/courses/CourseState.dart';

class CourseContent extends StatelessWidget{
  
  const CourseContent();
  
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CourseBloc>(context);

    return StreamBuilder<CoursesState>(
        initialData: bloc.state,
        stream: bloc.observableState,
        builder: (context, snapshot){
          final state = snapshot.data;

          if(state is LoadingCourseState){
            return const Center(child: CircularProgressIndicator());
          }else if(state is ErrorCourseState){
            return Center(child: Text("Error de carga"));
          }else if (state is LoadedCoursesState){
            return _renderCoursesContent(context, state);
          }
          return Center(child: Text("Error de carga"));
        });
  }

  Widget _renderCoursesContent(BuildContext context, LoadedCoursesState state) {
    final totalCourses = () => Column(children: <Widget>[
      const Divider(),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            'Total Courses',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(state.totalCourses.toString(),
              style: Theme.of(context).textTheme.titleLarge)
        ],
      )
    ]);

    /*final cartItems = () => ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: state.totalCourses,
        itemBuilder: (context, index) {
          if (index < state.courses.length) {
            final CourseState courseState = state.courses[index];

            return CartContentItem(courseState);
          } else {
            return totalCourses();
          }
        });*/

    final emptyCartItems = () => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          ' Empty Courses :(',
          style: Theme.of(context).textTheme.titleLarge,
        ));

    /*final content =
    state.items.isNotEmpty ? cartItems() : emptyCartItems();*/

    //return content;
    return totalCourses();
  }
}