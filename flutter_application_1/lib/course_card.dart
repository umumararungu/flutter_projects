import 'package:flutter/material.dart';
import 'course.dart';

class CourseCard extends StatelessWidget {
  final Course course;

  const CourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Image.network(course.imageUrl),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(course.title, style:const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text("Instructor: ${course.instructor}"),
                Text("Students: ${course.numberOfStudents}"),
                Text("Rating: ${course.rating} ⭐"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
