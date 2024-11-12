import 'package:flutter/material.dart';

import 'package:train_reservation_service/home_page/homepage.dart';
import 'package:train_reservation_service/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      home: const HomePage(),
    );
  }
}