import 'package:flutter/material.dart';
import 'package:health_app/ui/Home.dart';
import './ui/SignIn.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carolies-Count-App',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'SF-Pro-Text8'),
      debugShowCheckedModeBanner: false,
      home: new LoginScreen(),
    );
  }
}
