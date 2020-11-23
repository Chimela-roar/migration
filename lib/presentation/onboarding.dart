import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:migration/presentation/onboarding_screens/screen2.dart';
import 'package:migration/utility/routes.dart';
import 'package:sailor/sailor.dart';

import 'onboarding_screens/screen1.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 2;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 150),
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        height: 8.0,
        width: isActive ? 24.0 : 16.0,
        decoration: BoxDecoration(
            color: isActive ? Colors.white : Color(0XFF7B51D3),
            borderRadius: BorderRadius.all(Radius.circular(12))));
  }

  // final List<String> slides = [
  //   'images/Fast.png',
  //   'images/marginalia.png',
  // ];
  // final List<String> slidescontent = [
  //   'Fast and Reliable',
  //   'We deliver to an location'
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [
                    0.1,
                    0.4,
                    0.7,
                    0.9
                  ],
                  colors: [
                    Color(0xFFFFFFFF),
                    // Color(0xFFEF6A53),
                    Color(0xFF4563DB),
                    Color(0xFF5036D5),
                    Color(0xFF5B16D0),
                  ]),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      splashColor: Colors.transparent,
                      onPressed: () {
                        Routes.sailor.navigate('/Sign_up',
                            navigationType: NavigationType.pushReplace,
                            removeUntilPredicate: (route) => false,
                            transitions: [SailorTransition.slide_from_right]);
                      },
                      child: Text(
                        'Skip',
                        style: TextStyle(fontSize: 20.0, color: Colors.black),
                      ),
                    ),
                  ),
                  Container(
                    height: 600.0,
                    child: PageView(
                      physics: ClampingScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      children: <Widget>[
                        screen1(),
                        screen2(),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator(),
                  ),
                  _currentPage != _numPages - 1
                      ? Expanded(
                          child: Align(
                            alignment: FractionalOffset.bottomRight,
                            child: FlatButton(
                                onPressed: () {
                                  _pageController.nextPage(
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.ease);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      'Next',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 22.0),
                                    ),
                                  ],
                                )),
                          ),
                        )
                      : Text(''),
                ],
              ),
            ),
          ),
        ),
        bottomSheet: _currentPage == _numPages - 1
            ? Container(
                height: 60.0,
                width: double.infinity,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Routes.sailor.navigate('/Sign_up',
                                navigationType:
                                    NavigationType.pushAndRemoveUntil,
                                removeUntilPredicate: (route) => false,
                                transitions: [
                                  SailorTransition.slide_from_bottom
                                ]);
                          },
                          child: Text(
                            'Get Started',
                            style: TextStyle(
                                color: Color(0xFF5036D5),
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : Text(''));
  }
}
