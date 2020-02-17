import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:popflix/CORE/Helpers/Prefs.dart';
import 'package:popflix/UI/Screens/HomeScreen.dart';
import 'package:popflix/UI/Screens/OnboardingScreen.dart';
import 'package:shimmer/shimmer.dart';

class SplashScreen extends StatefulWidget {
  static const Route = "/splashscreen";
  static const DebugTag = "TAG - SPLASH_SCREEN";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    if (Prefs.isFirstRun())
      Navigator.of(context).pushReplacementNamed(FirstRunScreens.Route);
    else
      Navigator.of(context).pushReplacementNamed(HomeScreen.Route);
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child: Shimmer.fromColors(
          highlightColor: Colors.redAccent,
          baseColor: Colors.red,
          child: Text(
            "PopFlix",
            style: TextStyle(color: Colors.red, fontSize: 40),
          ),
        ),
      ),
    );
  }
}
