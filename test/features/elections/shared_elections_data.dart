import 'package:elections/core/constants/params.dart';
import 'package:elections/features/elections/models/elections_model.dart';

ElectionsModel mockElectionsModel = ElectionsModel(
  candidates: const ['1'],
  docId: 'docId',
  electionsEndDate: DateTime(2020),
  electionsStartDate: DateTime(
    2020,
  ),
);
const ElectionVoteParam mockElectionVoteParam = ElectionVoteParam(
  nationalIdNumber: 123456789,
  uid: 'uid',
  candidateName: 'candidateName',
);
