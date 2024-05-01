import 'package:flutter/material.dart';
import 'package:learn_flutter_app/screens/home_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // لضمان عرض العناصر بشكل صحيح وفقًا لللغة المحددة
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // تحديد اللغات المدعومة في التطبيق
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      // تعيين اللغة العربية في التطبيق
      locale: Locale('ar'),
      home: HomeScreen(),
    );
  }
}
