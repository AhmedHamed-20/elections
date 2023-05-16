import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elections/core/constants/params.dart';

import '../../registrations/models/registration_model.dart';
import '../models/elections_model.dart';

abstract class BaseElectionsDataSource {
  Future<ElectionsModel> getAvailableElections();
  Future<void> electionVote(ElectionVoteParam electionVoteParam);
  Future<FireStoreUserDataModel> getSignedInUserFromFireStore(String uid);
  Future<void> updateSignedInUserVoteStatus(FireStoreUserDataModel newUserData);

  Stream<DocumentSnapshot<Map<String, dynamic>>> getDocDataAsSnapshot(
    String collectionName,
    String collectionDocId,
  );
  Future<void> signOut();
}
