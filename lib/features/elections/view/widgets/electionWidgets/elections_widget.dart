import 'package:elections/core/widgets/error_screen.dart';
import 'package:elections/features/elections/view/widgets/electionWidgets/you_voted_before_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/constant.dart';
import '../../../../../core/utls/utls.dart';
import '../../../view_model/elections_cubit.dart';
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
    getAvailbleElectionsAndSignedInUser();
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
              return const YouVotedBeforeWidget();
            } else {
              return const CandidatesWidget();
            }
          case BaseRequestStatus.error:
            return ErrorScreen(
                message: state.errorMessage,
                isHoleScreen: false,
                onRetryPressed: () {
                  getAvailbleElectionsAndSignedInUser();
                });
        }
      },
    );
  }

  void getAvailbleElectionsAndSignedInUser() {
    final electionsCubit = BlocProvider.of<ElectionsCubit>(context);
    electionsCubit.getAvailableElections();
    electionsCubit.getSignedInUserFromFireStore(Constants.uid);
  }
}
