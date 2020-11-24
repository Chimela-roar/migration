import 'package:flutter/material.dart';
import 'package:migration/utility/functions.dart';
import 'package:migration/utility/routes.dart';
import 'package:migration/utility/size_config.dart';
import 'package:sailor/sailor.dart';

class LogIn extends StatefulWidget {
  LogIn({Key key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.all(50),
          child: Column(
            children: <Widget>[
              Hero(tag: 'logo', child: Image.asset("images/migration.png")),
              SizedBox(height: SizeConfig.heightMultiplier * 4),
              InputField(
                hinttitle: 'Email',
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 5),
              InputField(
                hinttitle: 'Password',
                hidepassword: true,
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 7,
              ),
              FlatButton(
                onPressed: () {
                  Routes.sailor.navigate('/Home',
                      navigationType: NavigationType.push,
                      removeUntilPredicate: (route) => false,
                      transitions: [SailorTransition.slide_from_right]);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                color: Colors.purple,
                child: Text(
                  'Log In',
                  style: TextStyle(
                      fontSize: SizeConfig.textSizeMultiplier * 5,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an acoount?',
                  ),
                  InkWell(
                    onTap: () {
                      Routes.sailor.navigate('/Sign_up',
                          navigationType: NavigationType.pushReplace,
                          removeUntilPredicate: (route) => false,
                          transitions: [SailorTransition.slide_from_right]);
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(color: Colors.purple),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}

class InputField extends StatelessWidget {
  final String hinttitle;
  final bool hidepassword;

  const InputField({Key key, this.hinttitle, this.hidepassword = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: hidepassword,
      onChanged: (value) {
        print(value);
      },
      validator: emailValidator,
      decoration: InputDecoration(
          labelText: hinttitle,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(width: 0.5, color: Colors.purple))),
    );
  }
}
