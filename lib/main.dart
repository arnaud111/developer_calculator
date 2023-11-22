import 'package:developer_calculator/widget/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Developer Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF31363B),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF31363B),
        ),
        scaffoldBackgroundColor: const Color(0xFF11161B),
      ),
      themeMode: ThemeMode.dark,
      home: const HomePage(),
    );
  }
}
