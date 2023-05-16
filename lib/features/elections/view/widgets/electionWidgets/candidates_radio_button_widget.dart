import 'package:elections/core/constants/extensions.dart';
import 'package:elections/features/elections/view/widgets/electionWidgets/success_candidates_widget.dart';
import 'package:flutter/material.dart';

class CandidatedRadioButtonsWidget extends StatelessWidget {
  const CandidatedRadioButtonsWidget({
    super.key,
    required this.candidates,
  });
  final List<dynamic> candidates;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StatefulBuilder(
        builder: (context, setState) => ListView.builder(
            itemCount: candidates.length,
            itemBuilder: (context, index) {
              return RadioListTile(
                value: index,
                groupValue: selectedCandidateIndex,
                title: Text(
                  candidates[index],
                  style: context.theme.textTheme.titleMedium,
                ),
                onChanged: (value) {
                  setState(() {
                    selectedCandidateIndex = value as int;
                  });
                },
              );
            }),
      ),
    );
  }
}
