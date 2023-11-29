import 'package:flutter/material.dart';
import 'package:skia_coffee/core/constants/consts.dart';
import 'package:skia_coffee/features/skeleton/splashscreen1.dart';
import 'package:skia_coffee/injection_container.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skisa_coffee',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: textColor,
          secondary: Colors.orange,
        ),
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(fontSize: 16),
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: textColor,
          secondary: Colors.orange,
        ), // Customize accent color for dark mode
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(fontSize: 16),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen1(),
    );
  }
}
