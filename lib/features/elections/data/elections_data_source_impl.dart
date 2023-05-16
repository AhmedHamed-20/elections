import 'package:elections/core/constants/app_strings.dart';
import 'package:elections/core/constants/params.dart';
import 'package:elections/core/errors/exceptions.dart';
import 'package:elections/core/errors/server_error_message_model.dart';
import 'package:elections/core/services/firestoreFirebaseService/base_firestore_service.dart';
import 'package:elections/features/elections/data/base_elections_data_source.dart';
import 'package:elections/features/elections/models/elections_model.dart';
import 'package:elections/features/registrations/models/registration_model.dart';

class ElectionsDataSourceImpl implements BaseElectionsDataSource {
  final BaseFireStoreService _fireStoreService;
  const ElectionsDataSourceImpl(
    this._fireStoreService,
  );
  @override
  Future<ElectionsModel> getAvailableElections() async {
    try {
      final result = await _fireStoreService
          .readDataFromFireStore(AppStrings.electionsColloctionName);
      return ElectionsModel.fromJson(result.docs.first.data());
    } on Exception catch (e) {
      throw ServerException(
          serverErrorMessageModel: ServerErrorMessageModel.fromException(e));
    }
  }

  @override
  Future<void> electionVote(ElectionVoteParam electionVoteParam) async {
    try {
      await _fireStoreService.saveDataToFireStore(
          electionVoteParam.toJson(),
          AppStrings.votersColloctionName,
          electionVoteParam.nationalIdNumber.toString());
    } on Exception catch (e) {
      throw ServerException(
          serverErrorMessageModel: ServerErrorMessageModel.fromException(e));
    }
  }

  @override
  Future<FireStoreUserDataModel> getSignedInUserFromFireStore(
      String uid) async {
    try {
      final users = await _fireStoreService
          .readDataFromFireStore(AppStrings.collectionUsers);
      return users.docs
          .map((e) => FireStoreUserDataModel.fromJson(e.data()))
          .firstWhere((element) => element.uid == uid);
    } on Exception catch (e) {
      throw ServerException(
          serverErrorMessageModel: ServerErrorMessageModel.fromException(e));
    }
  }

  @override
  Future<void> updateSignedInUserVoteStatus(
      FireStoreUserDataModel newUserData) async {
    try {
      await _fireStoreService.updateDataToFireStore(newUserData.toJson(),
          AppStrings.collectionUsers, newUserData.uid.toString());
    } on Exception catch (e) {
      throw ServerException(
          serverErrorMessageModel: ServerErrorMessageModel.fromException(e));
    }
  }
}
