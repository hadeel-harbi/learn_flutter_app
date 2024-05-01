import 'package:flutter/material.dart';
import 'package:learn_flutter_app/screens/lesson_screen.dart';

class LessonList extends StatelessWidget {
  const LessonList({
    super.key,
    required this.data,
  });

  final Map data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LessonScreen(
              data: data,
            ),
          ),
        );
      },
      // -- Container has icon and name of the widget
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 1),
        padding: const EdgeInsets.symmetric(vertical: 4),
        color: Colors.white,
        child: ListTile(
          leading: Icon(data["icon"]),
          title: Text(
            data["name"],
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            data["name_ar"],
            style: const TextStyle(
                color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: Color(0xffaf9c6f),
          ),
        ),
      ),
    );
  }
}
