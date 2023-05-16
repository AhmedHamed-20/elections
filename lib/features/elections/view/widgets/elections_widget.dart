import 'package:elections/core/constants/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/constant.dart';
import '../../../../core/utls/utls.dart';
import '../../view_model/elections_cubit.dart';
import 'main_candidates_widget.dart';

class ElectionsWidget extends StatefulWidget {
  const ElectionsWidget({
    super.key,
  });

  @override
  State<ElectionsWidget> createState() => _ElectionsWidgetState();
}

class _ElectionsWidgetState extends State<ElectionsWidget> {
  @override
  void initState() {
    super.initState();
    final electionsCubit = BlocProvider.of<ElectionsCubit>(context);
    electionsCubit.getAvailableElections();
    electionsCubit.getSignedInUserFromFireStore(Constants.uid);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ElectionsCubit, ElectionsState>(
      builder: (context, state) {
        switch (state.getSignedInUserStatus) {
          case BaseRequestStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case BaseRequestStatus.success:
            if (state.signedInUser!.isVote) {
              return Center(
                child: Text(
                  AppStrings.youVoted,
                  style: context.theme.textTheme.titleMedium,
                ),
              );
            } else {
              return const CandidatesWidget();
            }
          case BaseRequestStatus.error:
            return Center(
              child: Text(
                state.errorMessage,
                style: context.theme.textTheme.titleMedium,
              ),
            );
        }
      },
    );
  }
}
