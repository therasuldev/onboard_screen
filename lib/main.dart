import 'package:coffee/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:coffee/onboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialRoute: '/',
        routes: {
          '/': (context) => const OnboardScreen(),
          '/home': (context) =>  HomePage()
        },
      );
}
