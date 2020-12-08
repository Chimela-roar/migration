import 'package:flutter/material.dart';

class DrawerLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      endDrawer: ClipPath(
        clipper: __DrawerClipper(),
        child: Drawer(
          child: Column(
            children: <Widget>[
              Text("Home"),
              Text("Settings"),
              Text("Sign out"),
            ],
          ),
        ),
      ),
    );
  }
}

class __DrawerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(50, 0);
    path.quadraticBezierTo(0, size.height / 2, 50, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
