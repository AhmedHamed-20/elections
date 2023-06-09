import 'package:elections/core/constants/app_strings.dart';
import 'package:elections/core/constants/params.dart';
import 'package:elections/core/errors/exceptions.dart';
import 'package:elections/core/services/authFirebaseService/base_auth_service.dart';
import 'package:elections/core/services/firestoreFirebaseService/base_firestore_service.dart';
import 'package:elections/features/elections/data/elections_data_source_impl.dart';
import 'package:elections/features/registrations/models/registration_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'elections_data_source_impl_test.mocks.dart';

@GenerateMocks([BaseFireStoreService, BaseAuthService])
void main() {
  late BaseFireStoreService fireStoreService;
  late BaseAuthService authService;
  late ElectionsDataSourceImpl electionsDataSourceImpl;

  const ElectionVoteParam mockElectionVoteParam = ElectionVoteParam(
    nationalIdNumber: 123456789,
    uid: 'uid',
    candidateName: 'candidateName',
  );

  const FireStoreUserDataModel mockFireStoreUserDataModel =
      FireStoreUserDataModel(
    uid: 'uid',
    nationalNumber: 123456789,
    name: 'name',
    email: 'email',
    identityImageUrl: 'identityImage',
    isVote: true,
  );
  setUp(() {
    fireStoreService = MockBaseFireStoreService();
    authService = MockBaseAuthService();
    electionsDataSourceImpl =
        ElectionsDataSourceImpl(fireStoreService, authService);
  });

  group('test elections data source', () {
    test('getAvailableElections throws serverException on failure', () async {
      // arrange
      when(fireStoreService
              .readDataFromFireStore(AppStrings.electionsColloctionName))
          .thenThrow(Exception());

      expect(() => electionsDataSourceImpl.getAvailableElections(),
          throwsA(isInstanceOf<ServerException>()));

      verify(fireStoreService
              .readDataFromFireStore(AppStrings.electionsColloctionName))
          .called(1);
    });

    test('electionVote throws serverException on failure', () async {
      // arrange
      when(fireStoreService.saveDataToFireStoreWithId(
              mockElectionVoteParam.toJson(),
              AppStrings.votersColloctionName,
              mockElectionVoteParam.nationalIdNumber.toString()))
          .thenThrow(Exception());

      expect(() => electionsDataSourceImpl.electionVote(mockElectionVoteParam),
          throwsA(isInstanceOf<ServerException>()));

      verify(fireStoreService.saveDataToFireStoreWithId(
              mockElectionVoteParam.toJson(),
              AppStrings.votersColloctionName,
              mockElectionVoteParam.nationalIdNumber.toString()))
          .called(1);
    });

    test('getSignedInUserFromFireStore throws serverException on failure',
        () async {
      // arrange
      when(fireStoreService.readDataFromFireStore(AppStrings.collectionUsers))
          .thenThrow(Exception());

      expect(() => electionsDataSourceImpl.getSignedInUserFromFireStore('uid'),
          throwsA(isInstanceOf<ServerException>()));

      verify(fireStoreService.readDataFromFireStore(AppStrings.collectionUsers))
          .called(1);
    });

    test('updateSignedInUserVoteStatus throws serverException on failure',
        () async {
      // arrange
      when(fireStoreService.updateDataToFireStore(
              mockFireStoreUserDataModel.toJson(),
              AppStrings.collectionUsers,
              mockFireStoreUserDataModel.uid.toString()))
          .thenThrow(Exception());

      expect(
          () => electionsDataSourceImpl
              .updateSignedInUserVoteStatus(mockFireStoreUserDataModel),
          throwsA(isInstanceOf<ServerException>()));

      verify(fireStoreService.updateDataToFireStore(
              mockFireStoreUserDataModel.toJson(),
              AppStrings.collectionUsers,
              mockFireStoreUserDataModel.uid.toString()))
          .called(1);
    });

    test('getDocDataAsSnapshot throws serverException on failure', () async {
      // arrange
      when(fireStoreService.getDocDataAsSnapshot('collectionName', 'docId'))
          .thenThrow(Exception());

      expect(
          () => electionsDataSourceImpl.getDocDataAsSnapshot(
              'collectionName', 'docId'),
          throwsA(isInstanceOf<ServerException>()));

      verify(fireStoreService.getDocDataAsSnapshot('collectionName', 'docId'))
          .called(1);
    });

    test('signOut throws serverException on failure', () async {
      // arrange
      when(authService.signOut()).thenThrow(Exception());

      expect(() => electionsDataSourceImpl.signOut(),
          throwsA(isInstanceOf<ServerException>()));

      verify(authService.signOut()).called(1);
    });
  });
}
