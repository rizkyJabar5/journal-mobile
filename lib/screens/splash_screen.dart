import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:journal_florist/screens/home.dart';
import 'package:journal_florist/screens/login.dart';
import 'package:journal_florist/widgets/bottom_bar.dart';

class SplasScreen extends StatefulWidget{
  const SplasScreen({Key? key}) : super(key: key);

  @override
  State<SplasScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplasScreen>{
  bool isVisible = false;
  double percent = 0.0;

  @override
  void initState(){
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async{
    var duration = const Duration(seconds: 5);
    return Timer(duration, (){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_){
          return LoginPage();
        }),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 241, 241),
      body: Center(
        child: 
        Image.asset("assets/images/logo.jpg",width: 250.0,height: 200.0),
      ),
      
    );
  }

}