import 'package:flutter/material.dart';
import 'package:learn_flutter_app/data/data.dart';
import 'package:learn_flutter_app/constants/colors.dart';
import 'package:learn_flutter_app/widgets/lesson_list.dart';

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
              for (Map data in lessonsList) LessonList(data: data),
            ],
          ),
        ),
      ),
    );
  }
}
