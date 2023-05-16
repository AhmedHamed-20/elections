import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
}

extension AppSizeExtension on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
}

extension NaviagtionExtension on BuildContext {
  void navigateTo(Widget widget) {
    Navigator.of(this).push(MaterialPageRoute(builder: (_) => widget));
  }

  void navigateToNamed(String routeName, {Object? arguments}) {
    Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  void navigateToAndRemoveUntil(
    Widget widget,
  ) {
    Navigator.of(this).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => widget), (route) => false);
  }

  void navigateToAndRemoveUntilNamed(String routeName, {Object? arguments}) {
    Navigator.of(this).pushNamedAndRemoveUntil(routeName, (route) => false,
        arguments: arguments);
  }

  void naviagtorPop() {
    Navigator.of(this).pop();
  }
}

extension ReturnDurationBetweenTwoDates on DateTime {
  String getDurationAsStringBetweenTwoDates(DateTime dateTime) {
    final difference = this.difference(dateTime);
    final days = difference.inDays;
    final hours = difference.inHours - (days * 24);
    final minutes = difference.inMinutes - (hours * 60) - (days * 24 * 60);
    final seconds = difference.inSeconds -
        (minutes * 60) -
        (hours * 60 * 60) -
        (days * 24 * 60 * 60);
    return '$days days, $hours hours, $minutes minutes, $seconds seconds';
  }

  DateTime getDifferenceAsDateTimeBetweenTwoDates(DateTime dateTime) {
    final difference = this.difference(dateTime);
    final days = difference.inDays;
    final hours = difference.inHours - (days * 24);
    final minutes = difference.inMinutes - (hours * 60) - (days * 24 * 60);
    final seconds = difference.inSeconds -
        (minutes * 60) -
        (hours * 60 * 60) -
        (days * 24 * 60 * 60);
    return DateTime(days, hours, minutes, seconds);
  }

  bool isNowBetweenTwoDate(DateTime startDate, DateTime endDate) {
    final now = this;

    if (now.isAfter(startDate) && now.isBefore(endDate)) {
      return true;
    } else {
      return false;
    }
  }
}
