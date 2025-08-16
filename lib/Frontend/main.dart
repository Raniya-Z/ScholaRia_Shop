import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scholaria_shop_v1/Frontend/page_splash1.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:scholaria_shop_v1/Frontend/theme_provider.dart';
import '../backend/Services_Firbase/firebase_options.dart';
import 'Frontend/page_splash1.dart';
import 'Frontend/compte_utilisateur.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //line 1 db

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.themeMode,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFAFAFA),
        brightness: Brightness.light,
        fontFamily: 'Roboto',
        primarySwatch: Colors.pink,
      ),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF121212),
        brightness: Brightness.dark,
        fontFamily: 'Roboto',
        primarySwatch: Colors.pink,
      ),
      home: const FirstPage(), // ← Splash screen
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {
    super.initState();
    // Attendre 3 secondes avant d’aller vers IntroPage
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const IntroPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : const Color(0xFFE61580),
      body: Center(
        child: Image.asset(
          isDark ? 'assets/logo1_sombre.png' : 'assets/logo.png',
          width: 300,
          height: 300,
        ),
      ),
    );
  }
}
