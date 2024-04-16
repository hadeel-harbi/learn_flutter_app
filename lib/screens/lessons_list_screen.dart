import 'package:flutter/material.dart';
import 'package:learn_flutter_app/data/data.dart';
import 'package:learn_flutter_app/screens/lesson_screen.dart';
import 'package:learn_flutter_app/constants/colors.dart';

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
      // ---- AppBar ----
      appBar: AppBar(
          title: Text(categoryName),
          backgroundColor: primaryColor,
          foregroundColor: Colors.white),
      backgroundColor: backgroundColor,
      // ---- Body ----
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (Map data in lessonsList)
                InkWell(
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
            ],
          ),
        ),
      ),
    );
  }
}
