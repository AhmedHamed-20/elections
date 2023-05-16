import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elections/core/constants/extensions.dart';
import 'package:elections/features/elections/view_model/elections_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_strings.dart';
import 'elections_availbe_widget.dart';
import 'elections_not_availble_widget.dart';

class ElectionsStreamBuilderWidget extends StatelessWidget {
  const ElectionsStreamBuilderWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ElectionsCubit, ElectionsState>(
      builder: (context, state) => StreamBuilder(
          stream: state.electionsDocAsSnapshot,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              DateTime electionsStartDate =
                  (snapshot.data!.data()![AppStrings.electionsStartDateTimeKey]
                          as Timestamp)
                      .toDate();
              DateTime electionsEndDate = (snapshot.data!
                      .data()![AppStrings.electionsEndDateTimeKey] as Timestamp)
                  .toDate();
              if (!checkAvailbiltyOfElections(
                  electionsStartDate, electionsEndDate)) {
                return const ElectionsNotAvailbeWidget();
              } else {
                return ElectionsAvailbleWidget(
                  electionsEndDate: electionsEndDate,
                  electionsStartDate: electionsStartDate,
                  candidates: snapshot.data!.data()![AppStrings.candidatesKey],
                );
              }
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  bool checkAvailbiltyOfElections(DateTime startDate, DateTime endDate) {
    if (DateTime.now().isNowBetweenTwoDate(startDate, endDate)) {
      return true;
    } else {
      return false;
    }
  }
}
