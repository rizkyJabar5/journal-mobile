import 'dart:async';

import 'package:flutter/material.dart';
import 'package:journal_florist/features/networking/token_repository.dart';
import 'package:journal_florist/screens/login.dart';
import 'package:journal_florist/widgets/bottom_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final storage = TokenRepository();

  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 3);
    final hasToken = await storage.hasToken();

    return Timer(duration, () {
      if (!hasToken) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) {
            return LoginPage();
          }),
        );
        return;
      }

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          return BottomBar();
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
