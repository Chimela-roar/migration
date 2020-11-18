import 'package:flutter/material.dart';
import 'package:migration/presentation/Sign_in.dart';
import 'package:migration/presentation/onboarding.dart';
import 'package:sailor/sailor.dart';

class Routes {
  static final sailor = Sailor();

  static void createRoutes() {
    sailor.addRoutes([
      SailorRoute(
          name: '/onboarding',
          builder: (context, args, params) {
            return OnboardingScreen();
          }),
      SailorRoute(
          name: '/Sign_in',
          builder: (context, args, params) {
            return SignIn();
          }),
    ]);
  }
}
