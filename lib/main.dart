import 'package:flutter/material.dart';
import 'package:introduction_screen_v1/screens/home_page.dart';
import 'package:introduction_screen_v1/screens/introduction_screen_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false, //Sağ Üstteki Debug Yazısını Kapatır.
      routes: {
        '/': (context) => IntroductionScreenPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
