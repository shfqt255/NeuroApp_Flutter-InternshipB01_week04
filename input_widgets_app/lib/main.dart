import 'package:flutter/material.dart';
import 'package:input_widgets_app/input_widgetss.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SurveyForm()
    );
  }
}
