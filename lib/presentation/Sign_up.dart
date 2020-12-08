import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:migration/utility/functions.dart';
import 'package:migration/utility/routes.dart';
import 'package:migration/utility/size_config.dart';
import 'package:sailor/sailor.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: ModalProgressHUD(
          color: Colors.purple,
          inAsyncCall: showSpinner,
          child: Container(
            padding: EdgeInsets.all(50),
            child: Column(
              children: <Widget>[
                Hero(tag: 'logo', child: Image.asset("images/migration.png")),
                SizedBox(height: SizeConfig.heightMultiplier * 4),
                InputField(
                  validate: emailValidator,
                  hinttitle: 'Email',
                  onchanged: (value) {
                    email = value;
                  },
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 5),
                InputField(
                  hinttitle: 'Phone Number',
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 5,
                ),
                InputField(
                  validate: passwordValidator,
                  hinttitle: 'Password',
                  hidepassword: true,
                  onchanged: (value) {
                    password = value;
                  },
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 7,
                ),
                FlatButton(
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);
                      if (newUser != null) {
                        Routes.sailor.navigate('/Home',
                            navigationType: NavigationType.pushReplace,
                            removeUntilPredicate: (route) => false,
                            transitions: [SailorTransition.slide_from_right]);
                      }
                      setState(() {
                        showSpinner = false;
                      });
                    } catch (e) {
                      print(e);
                    }
                  },
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
                SizedBox(height: SizeConfig.heightMultiplier * 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an acoount?',
                    ),
                    InkWell(
                      onTap: () {
                        Routes.sailor.navigate('/Log_in',
                            navigationType: NavigationType.pushReplace,
                            removeUntilPredicate: (route) => false,
                            transitions: [SailorTransition.slide_from_right]);
                      },
                      child: Text(
                        'Log In',
                        style: TextStyle(color: Colors.purple),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

class InputField extends StatelessWidget {
  final String hinttitle;
  final bool hidepassword;
  final Function onchanged;
  final Function validate;

  const InputField(
      {Key key,
      this.hinttitle,
      this.hidepassword = false,
      this.onchanged,
      this.validate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: hidepassword,
      onChanged: onchanged,
      validator: validate,
      decoration: InputDecoration(
          labelText: hinttitle,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(width: 0.5, color: Colors.purple))),
    );
  }
}
