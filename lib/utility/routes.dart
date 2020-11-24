import 'package:migration/presentation/Home.dart';
import 'package:migration/presentation/Log_in.dart';
import 'package:migration/presentation/Sign_up.dart';
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
          name: '/Sign_up',
          builder: (context, args, params) {
            return Signup();
          }),
      SailorRoute(
          name: '/Log_in',
          builder: (context, args, params) {
            return LogIn();
          }),
      SailorRoute(
          name: '/Home',
          builder: (context, args, params) {
            return HomeScreen();
          }),
    ]);
  }
}
