import 'package:flutter/material.dart';
import 'package:migration/utility/functions.dart';
import 'package:migration/utility/size_config.dart';

class Signup extends StatefulWidget {
  Signup({Key key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.all(50),
          child: Column(
            children: <Widget>[
              Image.asset("images/migration.png"),
              SizedBox(height: SizeConfig.heightMultiplier * 4),
              InputField(
                hinttitle: 'Email',
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 5),
              InputField(
                hinttitle: 'Phone Number',
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 5,
              ),
              InputField(
                hinttitle: 'Password',
                hidepassword: true,
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 7,
              ),
              FlatButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                color: Colors.purple,
                child: Text(
                  'Sign up',
                  style: TextStyle(
                      fontSize: SizeConfig.textSizeMultiplier * 5,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
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
