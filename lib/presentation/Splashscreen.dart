import 'dart:async';
import 'package:migration/utility/routes.dart';
import 'package:sailor/sailor.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      return Routes.sailor.navigate('/onboarding',
          navigationType: NavigationType.pushAndRemoveUntil,
          removeUntilPredicate: (routes) => false,
          transitions: [SailorTransition.fade_in]);
    });

    controller = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    );
    controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'images/migration.png',
          fit: BoxFit.contain,
          height: 100,
        ),
      ),
    );
  }
}
