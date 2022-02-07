import 'package:flutter/material.dart';
import 'package:bmi_calculator/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      
      home: HomeScreen(),
    );
  }
}

