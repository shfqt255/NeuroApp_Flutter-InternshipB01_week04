import 'package:flutter/material.dart';
import 'package:media_picker_app/date_time_picker.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Appointmentpage(),
    );
  }
}
