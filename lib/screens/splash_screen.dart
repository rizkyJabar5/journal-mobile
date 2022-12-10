import 'dart:async';

import 'package:flutter/material.dart';
import 'package:journal_florist/screens/login.dart';

class SplasScreen extends StatefulWidget {
  const SplasScreen({Key? key}) : super(key: key);

  @override
  State<SplasScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplasScreen> {
  bool isVisible = false;
  double percent = 0.0;

  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          return LoginPage();
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          "assets/images/logo.jpg",
          width: 500,
          height: 500,
        ),
      ),
    );
  }
}
