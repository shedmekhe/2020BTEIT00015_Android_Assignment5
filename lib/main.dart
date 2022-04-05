import 'package:flutter/material.dart';
import 'input_page.dart';
// import 'dart:html';
void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.lightGreen,
      ),
      home: InputPage(),
    );
  }
}
