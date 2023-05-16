import 'package:elections/core/constants/extensions.dart';
import 'package:flutter/material.dart';

int selectedCandidateIndex = 0;

class SuccessCndidateWidget extends StatelessWidget {
  final List<String> candidates;
  const SuccessCndidateWidget({super.key, required this.candidates});

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
