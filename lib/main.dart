import 'package:flutter/material.dart';

import 'screens/main/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "outlook",
      theme: ThemeData(),
      home: MainScreen(),
    );
  }
}
