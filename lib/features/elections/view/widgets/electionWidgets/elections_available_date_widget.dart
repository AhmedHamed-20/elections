import 'package:elections/core/constants/extensions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ElectionsAvailbleDateWidget extends StatelessWidget {
  const ElectionsAvailbleDateWidget(
      {super.key, required this.startDate, required this.endDate});
  final DateTime startDate;
  final DateTime endDate;

  @override
  Widget build(BuildContext context) {
    String formmater =
        '${DateFormat('yyyy-MM-dd – kk:mm').format(startDate)} to ${DateFormat('yyyy-MM-dd – kk:mm').format(endDate)}';
    return Text(
      'the elections available from $formmater',
      style: context.theme.textTheme.titleMedium,
      textAlign: TextAlign.center,
    );
  }

  Duration calculateDifference() {
    final difference = endDate.difference(startDate);
    return difference;
  }
}
