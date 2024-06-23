import 'package:flutter/material.dart';

class CalendarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('School Calendar'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Add notification functionality
            },
          ),
        ],
      ),
      body: CalendarBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new event functionality
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class CalendarBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sample data
    final events = [
      {'subject': 'Science', 'time': '8 am', 'color': Colors.blue, 'room': 'Lab 5a'},
      {'subject': 'Physics', 'time': '9 am', 'color': Colors.blueAccent, 'room': 'Lab 5c'},
      {'subject': 'Spanish', 'time': '10 am', 'color': Colors.orange, 'room': 'Lab 5b'},
      {'subject': 'English', 'time': '11 am', 'color': Colors.yellow, 'room': 'Lab 5a'},
      {'subject': 'Art', 'time': '12 pm', 'color': Colors.orangeAccent, 'room': 'Lab 5d'},
      {'subject': 'Biology', 'time': '1 pm', 'color': Colors.green, 'room': 'Lab 5c'},
      {'subject': 'Math', 'time': '2 pm', 'color': Colors.lightGreen, 'room': 'Lab 5d'},
      {'subject': 'History', 'time': '3 pm', 'color': Colors.greenAccent, 'room': 'Lab 5b'},
      {'subject': 'Computer Science', 'time': '4 pm', 'color': Colors.red, 'room': 'Building A2'},
    ];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Adjust based on your design
          childAspectRatio: 1 / 1.5, // Adjust based on your design
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        ),
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];
          return Card(
            color: event['color'] as Color,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event['subject'] as String,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  Text(
                    event['time'] as String,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    event['room'] as String,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
