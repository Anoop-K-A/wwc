import 'package:flutter/material.dart';
<<<<<<< Updated upstream
//import 'package:work_wave_connect/home_page.dart';
=======
<<<<<<< HEAD
import 'package:work_wave_connect/home_page.dart';
=======
//import 'package:work_wave_connect/home_page.dart';
>>>>>>> ca5eef3c90a9abbc3012b090a3b77f068732931a
>>>>>>> Stashed changes
import 'package:work_wave_connect/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WWC',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(235, 171, 164, 166),
        ),
        fontFamily: 'Oswald',
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 16, 75, 130),
          ),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 30,
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          titleSmall: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 10,
          ),
        ),
        useMaterial3: true,
      ),
      home: const Welcome(),
    );
  }
}
