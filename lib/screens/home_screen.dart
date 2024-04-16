import 'package:flutter/material.dart';
import 'package:learn_flutter_app/data/data.dart';
import 'package:learn_flutter_app/screens/lessons_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ---- AppBar ----
      appBar: AppBar(
        title: const Text(
          "تعلم Flutter",
        ),
        backgroundColor: const Color(0xff48a1bd),
        foregroundColor: Colors.white,
      ),
      backgroundColor: const Color.fromARGB(255, 228, 239, 243),
      // ---- Body ----
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xff48a1bd),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: Text(
                  "الفئات",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            GridView(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
              children: [
                for (Map data in categoriesList)
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LessonsList(
                            categoryName: data["name"],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            data["icon"],
                            size: 40,
                            color: const Color(0xffaf9c6f),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            data["name"],
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            data["name_ar"],
                            style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "تعلم مع",
                    style: TextStyle(
                        color: Color(0xff3e869c),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Image.asset(
                    "assets/nair-logo.png",
                    height: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
