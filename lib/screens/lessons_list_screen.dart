import 'package:flutter/material.dart';
import 'package:learn_flutter_app/data/data.dart';
import 'package:learn_flutter_app/screens/lesson_screen.dart';

class LessonsList extends StatelessWidget {
  const LessonsList({super.key, required this.categoryName});
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    List lessonsList = [];
    if (categoryName == "Widgets") {
      lessonsList = widgetsLessons;
    }
    return Scaffold(
      appBar: AppBar(
          title: Text(categoryName),
          backgroundColor: const Color(0xff48a1bd),
          foregroundColor: Colors.white),
      backgroundColor: const Color.fromARGB(255, 228, 239, 243),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          for (Map data in lessonsList)
            GestureDetector(
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
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 1),
                padding: const EdgeInsets.symmetric(vertical: 4),
                color: Colors.white,
                child: ListTile(
                  leading: Icon(data["icon"]),
                  title: Text(
                    data["name"],
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    data["name_ar"],
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xffaf9c6f),
                  ),
                ),
              ),
            ),
        ]),
      ),
    );
  }
}
