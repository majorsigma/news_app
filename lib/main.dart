import 'package:flutter/material.dart';
import 'package:news_app/pages/homepage.dart';
import 'package:news_app/utils/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Iroyin',
      theme: ThemeStyle.lightTheme,
      home: HomePage(),
    );
  }
}
