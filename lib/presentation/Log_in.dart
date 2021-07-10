import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:migration/utility/functions.dart';
import 'package:migration/utility/routes.dart';
import 'package:migration/utility/size_config.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:sailor/sailor.dart';
import 'package:firebase_database/firebase_database.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

@override
class _LogInState extends State<LogIn> {
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
        body: ModalProgressHUD(
          progressIndicator: CircularProgressIndicator(
            backgroundColor: Colors.purple,
          ),
          inAsyncCall: showSpinner,
          child: Form(
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
                    onchanged: (value) {
                      email = value;
                    },
                    hinttitle: 'Email',
                  ),
                  SizedBox(height: SizeConfig.heightMultiplier * 5),
                  InputField(
                    control: pwdInputController,
                    validate: passwordValidator,
                    onchanged: (value) {
                      password = value;
                    },
                    hinttitle: 'Password',
                    hidepassword: true,
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 5,
                  ),
                  ButtonBar(
                    children: [
                      Text(
                        'Forgot password?',
                        style: TextStyle(color: Colors.purple),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 5,
                  ),
                  FlatButton(
                    onPressed: () async {
                      setState(() {
                        showSpinner = true;
                      });
                      try {
                        if (_formKey.currentState.validate()) {
                          final user = await _auth.signInWithEmailAndPassword(
                              email: email, password: password);

                          if (user != null) {
                            return Routes.sailor.navigate('/TabHome',
                                navigationType: NavigationType.pushReplace,
                                removeUntilPredicate: (route) => false,
                                transitions: [
                                  SailorTransition.slide_from_right
                                ]);
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
            ),
          ),
        ));
  }
}

class InputField extends StatefulWidget {
  final String hinttitle;
  final bool hidepassword;
  final Function validate;
  final Widget icon;
  final Function onchanged;
  final TextEditingController control;

  const InputField({
    Key key,
    this.hinttitle,
    this.hidepassword = false,
    this.validate,
    this.icon,
    this.onchanged,
    this.control,
  }) : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.control,
      obscureText: widget.hidepassword,
      onChanged: widget.onchanged,
      validator: widget.validate,
      decoration: InputDecoration(
          icon: widget.icon,
          labelText: widget.hinttitle,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(width: 0.5, color: Colors.purple))),
    );
  }
}
