import 'package:elections/core/constants/params.dart';
import 'package:elections/core/widgets/default_button.dart';
import 'package:elections/features/elections/view/widgets/success_candidates_widget.dart';
import 'package:elections/features/registrations/models/registration_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_strings.dart';
import '../../view_model/elections_cubit.dart';

class ElectionButtonDesignWidget extends StatelessWidget {
  const ElectionButtonDesignWidget(
      {super.key, required this.candidate, required this.signedInUser});
  final List<String> candidate;
  final FireStoreUserDataModel signedInUser;
  @override
  Widget build(BuildContext context) {
    final electionsCubit = BlocProvider.of<ElectionsCubit>(context);
    return DefaultButtonWithTextWidget(
      onPressed: () {
        final electionVoteParams = ElectionVoteParam(
            nationalIdNumber: signedInUser.nationalNumber,
            candidateName: candidate[selectedCandidateIndex],
            uid: signedInUser.uid);
        electionsCubit.electionVote(electionVoteParams);
      },
      text: AppStrings.vote,
    );
  }
}
