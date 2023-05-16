import 'package:elections/core/constants/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/app_assets_path.dart';
import '../../../../../core/constants/app_strings.dart';

class YouVotedBeforeWidget extends StatelessWidget {
  const YouVotedBeforeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(AppAssetsPath.doneAssetPath),
          Text(
            AppStrings.youVoted,
            style: context.theme.textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
