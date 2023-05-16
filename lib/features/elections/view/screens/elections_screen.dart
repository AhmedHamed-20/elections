import 'package:elections/core/constants/app_padding.dart';
import 'package:elections/core/constants/app_strings.dart';
import 'package:elections/core/constants/constant.dart';
import 'package:elections/core/constants/extensions.dart';
import 'package:elections/core/services/service_locator.dart';
import 'package:elections/features/elections/view_model/elections_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utls/utls.dart';
import '../widgets/election_vote_button_widget.dart';
import '../widgets/main_candidates_widget.dart';

class ElectionsScreen extends StatelessWidget {
  const ElectionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<ElectionsCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppStrings.voteNow,
            style: context.theme.textTheme.titleMedium,
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.all(AppPadding.p12),
          child: ElectionsWidget(),
        ),
      ),
    );
  }
}

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
              return Column(
                children: const [
                  CandidatesWidget(),
                  ElectionVoteButtonWidget(),
                ],
              );
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
