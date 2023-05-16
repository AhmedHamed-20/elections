import 'package:elections/core/constants/app_strings.dart';
import 'package:elections/core/constants/extensions.dart';
import 'package:elections/features/elections/view_model/elections_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routes/app_routes_names.dart';
import '../../../../core/utls/utls.dart';

class SignOutAlertDialog extends StatelessWidget {
  const SignOutAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final electionsCubit = BlocProvider.of<ElectionsCubit>(context);
    return BlocListener<ElectionsCubit, ElectionsState>(
      listener: (context, state) {
        if (state.signOutStatus == BaseRequestStatusWithIdleState.success) {
          context.naviagtorPop();
          context.navigateToAndRemoveUntilNamed(AppRoutesNames.registrations);
        }
      },
      child: AlertDialog(
        title: Text(
          AppStrings.areYouSureYouWantToSignOut,
          style: context.theme.textTheme.titleMedium,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(
              AppStrings.no,
              style: context.theme.textTheme.titleSmall,
            ),
          ),
          TextButton(
            onPressed: () {
              electionsCubit.signOut();
            },
            child: Text(
              AppStrings.yes,
              style: context.theme.textTheme.titleSmall,
            ),
          ),
        ],
      ),
    );
  }
}
