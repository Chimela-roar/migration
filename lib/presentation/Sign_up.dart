import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:migration/utility/functions.dart';
import 'package:migration/utility/routes.dart';
import 'package:migration/utility/size_config.dart';
import 'package:sailor/sailor.dart';
import 'package:firebase_database/firebase_database.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  final _formKey = GlobalKey<FormState>();
  DatabaseReference dbRef =
      FirebaseDatabase.instance.reference().child("Users");
  TextEditingController emailInputController;
  TextEditingController pwdInputController;

  @override
  initState() {
    emailInputController = new TextEditingController();
    pwdInputController = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.all(50),
            child: Column(
              children: <Widget>[
                Hero(tag: 'logo', child: Image.asset("images/migration.png")),
                SizedBox(height: SizeConfig.heightMultiplier * 4),
                InputField(
                  control: emailInputController,
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
                  control: pwdInputController,
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
                      if (_formKey.currentState.validate()) {
                        final newUser =
                            await _auth.createUserWithEmailAndPassword(
                                email: email, password: password);

                        if (newUser != null) {
                          return Routes.sailor.navigate('/Home',
                              navigationType: NavigationType.pushReplace,
                              removeUntilPredicate: (route) => false,
                              transitions: [SailorTransition.slide_from_right]);
                        }
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
  final TextEditingController control;

  const InputField(
      {Key key,
      this.hinttitle,
      this.hidepassword = false,
      this.onchanged,
      this.validate,
      this.control})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: control,
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
