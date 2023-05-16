import 'package:elections/core/constants/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';

class ElectionsNotAvailbeWidget extends StatelessWidget {
  const ElectionsNotAvailbeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppStrings.electionsNotAvailble,
        style: context.theme.textTheme.titleMedium,
      ),
    );
  }
}
