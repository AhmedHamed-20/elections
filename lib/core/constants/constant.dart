import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Constants {
  static String uid = '';
  static void showToast(
      {required String message,
      required Color backgroundColor,
      required Color textColor}) {
    Fluttertoast.showToast(
        msg: message, backgroundColor: backgroundColor, textColor: textColor);
  }
}
