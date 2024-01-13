import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:skia_coffee/core/constants/consts.dart';
import 'package:skia_coffee/features/skeleton/bottom_navigation.dart';
import 'package:skia_coffee/features/skeleton/splashscreen1.dart';
import 'package:skia_coffee/firebase_options.dart';
import 'package:skia_coffee/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initializeDependencies();
  runApp(const MyApp());
}

Future<void> initializeFirebase() async {}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var auth = FirebaseAuth.instance;
  var isLogin = false;
  checkIfLogin() async {
    auth.authStateChanges().listen((User? user) {
      if (user != null && mounted) {
        setState(() {
          isLogin = true;
        });
      }
    });
  }

  @override
  void initState() {
    checkIfLogin();
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Skia_coffee',
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
      home: const BottomNavigation(curHome: 0),
      // isLogin ? const BottomNavigation(curHome: 0) : const SplashScreen1(),
      // const BottomNavigation(curHome: 0),
    );

    //  FutureBuilder(
    //   // Initialize FlutterFire
    //   future: Firebase.initializeApp(),
    //   builder: (context, snapshot) {
    //     // Check for errors
    //     if (snapshot.hasError) {
    //       Logger logger = Logger();
    //       logger.i(snapshot.error);
    //       return MaterialApp(home: Text(snapshot.error.toString()));
    //     }

    //     // Once complete, show your application
    //     if (snapshot.connectionState == ConnectionState.done) {
    //       return
    //     }

    //     // Otherwise, show something whilst waiting for initialization to complete
    //     return const MaterialApp(home: const Text("Loading.."));
    //   },
    // );
  }
}
