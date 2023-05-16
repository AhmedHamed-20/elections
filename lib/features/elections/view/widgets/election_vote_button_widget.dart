import 'package:elections/features/elections/view_model/elections_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utls/utls.dart';
import 'election_vote_button_design_widget.dart';

class ElectionVoteButtonWidget extends StatelessWidget {
  const ElectionVoteButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ElectionsCubit, ElectionsState>(
        builder: (context, state) {
      switch (state.electionVoteStatus) {
        case BaseRequestStatusWithIdleState.idle:
          return ElectionButtonDesignWidget(
            candidate: state.electionsModel!.candidates,
            signedInUser: state.signedInUser!,
          );
        case BaseRequestStatusWithIdleState.loading:
          return const Center(
            child: CircularProgressIndicator(),
          );
        case BaseRequestStatusWithIdleState.success:
          return ElectionButtonDesignWidget(
            candidate: state.electionsModel!.candidates,
            signedInUser: state.signedInUser!,
          );
        case BaseRequestStatusWithIdleState.error:
          return ElectionButtonDesignWidget(
            candidate: state.electionsModel!.candidates,
            signedInUser: state.signedInUser!,
          );
      }
    });
  }
}
