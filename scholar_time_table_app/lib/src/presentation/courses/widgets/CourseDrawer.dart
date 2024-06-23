import 'package:flutter/material.dart';
import 'package:scholar_time_table_app/src/presentation/courses/widgets/CouseContent.dart';

class CourseDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 110,
            child: DrawerHeader(
                padding: EdgeInsets.zero,
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.shopping_cart),
                      Text(
                        'Courses',
                        style: Theme.of(context).textTheme.titleLarge,
                      )
                    ],
                  ),
                  onTap: () {},
                )),
          ),
          const Expanded(child: CourseContent())
        ],
      ),
    );
  }

}