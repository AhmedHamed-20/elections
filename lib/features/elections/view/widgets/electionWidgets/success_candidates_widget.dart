import 'package:elections/core/constants/app_strings.dart';
import 'package:elections/core/constants/extensions.dart';
import 'package:elections/features/elections/models/elections_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utls/utls.dart';
import '../../../view_model/elections_cubit.dart';
import 'elections_stream_builder_widget.dart';

int selectedCandidateIndex = 0;

class SuccessCndidateWidget extends StatefulWidget {
  final ElectionsModel electionsModel;
  const SuccessCndidateWidget({super.key, required this.electionsModel});

  @override
  State<SuccessCndidateWidget> createState() => _SuccessCndidateWidgetState();
}

class _SuccessCndidateWidgetState extends State<SuccessCndidateWidget> {
  @override
  void initState() {
    super.initState();
    getElectionsDocAsSnapshot();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ElectionsCubit, ElectionsState>(
        builder: (context, state) {
      switch (state.getElectionsDocAsSnapshotStatus) {
        case BaseRequestStatus.loading:
          return const Center(child: CircularProgressIndicator());
        case BaseRequestStatus.success:
          return const ElectionsStreamBuilderWidget();
        case BaseRequestStatus.error:
          return Center(
            child: Text(
              state.errorMessage,
              style: context.theme.textTheme.titleMedium,
            ),
          );
      }
    });
  }

  void getElectionsDocAsSnapshot() {
    final electionsCubit = BlocProvider.of<ElectionsCubit>(context);
    electionsCubit.getElectionsDocAsSnapshot(
        collectionName: AppStrings.electionsColloctionName,
        collectionDocId: widget.electionsModel.docId);
  }
}
