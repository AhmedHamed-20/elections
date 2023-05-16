import 'package:flutter/material.dart';

import 'candidates_radio_button_widget.dart';
import '../voteButton/election_vote_button_widget.dart';
import 'elections_available_date_widget.dart';

class ElectionsAvailbleWidget extends StatelessWidget {
  const ElectionsAvailbleWidget({
    super.key,
    required this.electionsEndDate,
    required this.electionsStartDate,
    required this.candidates,
  });

  final DateTime electionsEndDate;
  final DateTime electionsStartDate;
  final List<dynamic> candidates;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElectionsAvailbleDateWidget(
          endDate: electionsEndDate,
          startDate: electionsStartDate,
        ),
        CandidatedRadioButtonsWidget(candidates: candidates),
        const ElectionVoteButtonWidget(),
      ],
    );
  }
}
