import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:elections/core/errors/failures.dart';
import 'package:elections/features/elections/models/elections_model.dart';
import 'package:elections/features/registrations/models/registration_model.dart';

import '../../../core/constants/params.dart';

abstract class BaseElectionsRepository {
  Future<Either<Failure, ElectionsModel>> getAvailableElections();
  Future<Either<Failure, void>> electionVote(
      ElectionVoteParam electionVoteParam);
  Future<Either<Failure, FireStoreUserDataModel>>
      getSignedInUserDataFromFireStore(String uid);
  Future<Either<Failure, void>> updateSignedInUserVoteStatus(
      FireStoreUserDataModel newUserData);

  Either<Failure, Stream<DocumentSnapshot<Map<String, dynamic>>>>
      getDocDataAsSnapshot(
    String collectionName,
    String collectionDocId,
  );
  Future<Either<Failure, void>> signOut();
}
