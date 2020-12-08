import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

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
  Pattern pattern = r'^(?=.*?[0-9])';
  RegExp regex = new RegExp(pattern);
  if (val.isEmpty) {
    return 'Password is required';
  } else if (val.length < 5) {
    return 'Incorrect password';
  } else if (!regex.hasMatch(val)) {
    return 'Invalid password';
  }
  return null;
}

String initialName(String userName) {
  String name = userName;
  List<String> data = name.split("");
  List<String> newData = List<String>();

  for (int i = 0; i < data.length; i++) {
    if (data[i].toUpperCase() == data[i]) {
      newData.remove(" ");
      newData.add(data[i]);
    }
  }

  return "${newData[0]}${newData[1]}";
}

String formatTime(DateTime now) {
  return DateFormat('hh:mm a').format(now);
}

formatAgo(DateTime now) {
  return toBeginningOfSentenceCase(Jiffy(now).fromNow.call());
}

String values(String data, var item) {
  switch (data) {
    case "List<dynamic>":
      return item[0].toString();
      break;
    case "int":
      return item.toString();
      break;
    case "Null":
      return "";
      break;
    default:
      return item.toString();
  }
}

String removeSquareBracket(String value) {
  String data = value;
  if (value.contains('[') && value.contains(']')) {
    List<String> valueList = data.split('');
    valueList.removeAt(0);
    valueList.removeAt(valueList.length - 1);
    return valueList.join();
  } else {
    return value;
  }
}

String removeHashForColor(String value) {
  String data = value ?? "#cfcdca";

  List<String> valueList = data.split('');
  valueList.removeAt(0);
  return valueList.join().toUpperCase();
}
