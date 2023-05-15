import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(
    {required String message,
    required Color backgroundColor,
    required Color textColor}) {
  Fluttertoast.showToast(
      msg: message, backgroundColor: backgroundColor, textColor: textColor);
}
