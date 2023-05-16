import 'package:elections/core/constants/extensions.dart';
import 'package:elections/features/elections/view/widgets/electionWidgets/success_candidates_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utls/utls.dart';
import '../../../view_model/elections_cubit.dart';

class CandidatesWidget extends StatelessWidget {
  const CandidatesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ElectionsCubit, ElectionsState>(
      builder: (context, state) {
        switch (state.getAvailableElectionsStatus) {
          case BaseRequestStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case BaseRequestStatus.success:
            return SuccessCndidateWidget(
              electionsModel: state.electionsModel!,
            );
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
