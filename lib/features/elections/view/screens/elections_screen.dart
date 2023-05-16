import 'package:elections/core/constants/app_padding.dart';
import 'package:elections/core/constants/app_strings.dart';
import 'package:elections/core/constants/extensions.dart';
import 'package:elections/features/elections/view_model/elections_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/electionWidgets/elections_widget.dart';
import '../widgets/sign_out_alert_dialog.dart';

class ElectionsScreen extends StatelessWidget {
  const ElectionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.voteNow,
          style: context.theme.textTheme.titleMedium,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: context.theme.primaryColor,
            ),
            onPressed: () {
              final electionsCubit = BlocProvider.of<ElectionsCubit>(context);
              showDialog(
                context: context,
                builder: (context) => BlocProvider.value(
                    value: electionsCubit, child: const SignOutAlertDialog()),
              );
            },
          )
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(AppPadding.p12),
        child: ElectionsWidget(),
      ),
    );
  }
}
