import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:migration/presentation/onboarding.dart';
import 'package:migration/utility/routes.dart';
import 'package:migration/utility/size_config.dart';

void main() {
  Routes.createRoutes();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      SizeConfig()..init(constraints);
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Quabbly',
          theme: ThemeData(
            textTheme: GoogleFonts.bigShouldersDisplayTextTheme(
                Theme.of(context).textTheme),
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: OnboardingScreen(),
          onGenerateRoute: Routes.sailor.generator(),
          navigatorKey: Routes.sailor.navigatorKey);
    });
  }
}
