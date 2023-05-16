import 'package:elections/core/constants/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_strings.dart';

class ErrorScreen extends StatelessWidget {
  final String message;
  final bool isHoleScreen;
  final void Function()? onRetryPressed;
  const ErrorScreen(
      {super.key,
      required this.message,
      required this.isHoleScreen,
      required this.onRetryPressed});

  @override
  Widget build(BuildContext context) {
    if (isHoleScreen) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                message,
                style: context.theme.textTheme.titleMedium,
              ),
              SizedBox(height: 20.h),
              ElevatedButton(
                onPressed: onRetryPressed,
                child: Text(
                  AppStrings.retry,
                  style: context.theme.textTheme.titleSmall,
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              style: context.theme.textTheme.titleMedium,
            ),
            SizedBox(height: 20.h),
            ElevatedButton(
              onPressed: onRetryPressed,
              child: Text(
                AppStrings.retry,
                style: context.theme.textTheme.titleSmall,
              ),
            ),
          ],
        ),
      );
    }
  }
}
