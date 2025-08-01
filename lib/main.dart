import 'package:flutter/material.dart';
import 'package:student_management_system_app/pages/HomePage.dart';
import 'package:student_management_system_app/pages/ProfilePage.dart';
import 'package:student_management_system_app/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => Homepage(),
        '/profile': (context) => Profilepage(),
      },
    );
  }
}
