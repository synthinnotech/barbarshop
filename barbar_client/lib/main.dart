import 'package:barbar_client/controller/theme_controller.dart';
import 'package:barbar_client/view/initial_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Barbars',
      debugShowCheckedModeBanner: false,
      theme: ThemeController.lightTheme,
      darkTheme: ThemeController.darkTheme,
      home: InitialScreen(),
    );
  }
}
