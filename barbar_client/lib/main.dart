import 'package:barbar_client/controller/theme_controller.dart';
import 'package:barbar_client/view/initial_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barbar Visitor',
      debugShowCheckedModeBanner: false,
      theme: ThemeController.lightTheme,
      darkTheme: ThemeController.darkTheme,
      home: InitialScreen(),
    );
  }
}
