import 'package:flutter/material.dart';

String emailValidator(String value) {
  final val = value.trim();
  final RegExp reg = RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9]+\.[a-zA-Z0-9-.]+$");
  if (!reg.hasMatch(val)) {
    return 'Invalid email address';
  }
  return null;
}

String emptyStringValidator(String value) {
  final val = value.trim();
  if (val.isEmpty) {
    return 'Invalid URL';
  }
  return null;
}

String passwordValidator(String value) {
  final val = value.trim();
  if (val.isEmpty) {
    return 'Password is required';
  } else if (val.length < 8) {
    return 'Incorrect password';
  }
  return null;
}
