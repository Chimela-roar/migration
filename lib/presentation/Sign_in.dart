import 'package:flutter/material.dart';
import 'package:migration/utility/functions.dart';
import 'package:migration/utility/size_config.dart';

class SignIn extends StatefulWidget {
  SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF5036D5),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [
                    0.8,
                    1,
                  ],
                  colors: [
                    Color(0xFFFFFFFF),
                    Color(0xFF5036D5),
                    // Color(0xFFEF6A53),
                  ]),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                color: Colors.red,
                child: Column(
                  children: <Widget>[
                    Image.asset('images/migration_icon.png'),
                    Column(
                      children: <Widget>[
                        TextFormField(
                          validator: emailValidator,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  fontSize: SizeConfig.textSizeMultiplier * 4,
                                  fontWeight: FontWeight.w400),
                              hintText: "johndoe@gmail.com",
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 8),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                      width: 0.5, style: BorderStyle.solid)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                      width: 0.5, color: Colors.black))),
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
