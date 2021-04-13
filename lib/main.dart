import 'package:flutter/material.dart';
import 'package:news_app/pages/homepage.dart';
import 'package:news_app/services/service_locator.dart';
import 'package:news_app/utils/themes.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  setupGetIt();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News',
      theme: ThemeStyle.lightTheme,
      // Opens a Splashscreen before the home page is displayed
      home: SplashScreen(
          seconds: 4,
          navigateAfterSeconds: new HomePage(),
          title: new Text(
            'Simple News Reader',
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
          image: new Image.asset('assets/images/news_app.png', width: 300, height: 200,),
          backgroundColor: Colors.white,
          styleTextUnderTheLoader: new TextStyle(),
          photoSize: 100.0,
          loaderColor: Color(0xFFE44F50)),
    );
  }
}
