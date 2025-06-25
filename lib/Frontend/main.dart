


import 'dart:async';
import 'package:flutter/material.dart';
import 'package:scholaria_shop_v1/Frontend/page_splash1.dart'; // page d’introduction

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(), // ← On démarre ici
    );
  }
}

// ⚠️ ici, FirstPage devient un StatefulWidget pour gérer le Timer
class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {
    super.initState();
    // Attendre 4 secondes puis naviguer vers IntroPage
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const IntroPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE61580), // fond rose
      body: Center(
        child: Image.asset(
          'assets/logo.png', // ton logo
          width: 300,
          height: 300,
        ),
      ),
    );
  }
}


