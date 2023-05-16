import 'package:elections/core/errors/failures.dart';
import 'package:elections/features/elections/data/base_elections_data_source.dart';
import 'package:elections/features/elections/repository/elections_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../registrations/shared_registartions_data.dart';
import '../shared_elections_data.dart';
import 'elections_repository_impl_test.mocks.dart';

@GenerateMocks([BaseElectionsDataSource])
void main() {
  late BaseElectionsDataSource baseElectionsDataSource;
  late ElectionsRepositoryImpl electionsRepositoryImpl;

  setUp(() {
    baseElectionsDataSource = MockBaseElectionsDataSource();
    electionsRepositoryImpl = ElectionsRepositoryImpl(baseElectionsDataSource);
  });

  group('test elections repository', () {
    test(
        'getAvailableElections should return electionsModel on right when success',
        () async {
      // arrange
      when(baseElectionsDataSource.getAvailableElections())
          .thenAnswer((_) async => mockElectionsModel);

      // act
      final result = (await electionsRepositoryImpl.getAvailableElections())
          .fold((l) => null, (r) => r);

      // assert
      expect(result, mockElectionsModel);
      verify(baseElectionsDataSource.getAvailableElections()).called(1);
    });

    test(
        'getAvailableElections should return failure on left when serverException',
        () async {
      // arrange
      when(baseElectionsDataSource.getAvailableElections())
          .thenThrow(mockServerException);

      // act
      final result = (await electionsRepositoryImpl.getAvailableElections())
          .fold((l) => l, (r) => null);

      // assert
      expect(
        result,
        isInstanceOf<Failure>(),
      );
      verify(baseElectionsDataSource.getAvailableElections()).called(1);
    });
    test('electionVote should return failure on left when serverException',
        () async {
      // arrange
      when(baseElectionsDataSource.electionVote(mockElectionVoteParam))
          .thenThrow(mockServerException);

      // act
      final result =
          (await electionsRepositoryImpl.electionVote(mockElectionVoteParam))
              .fold((l) => l, (r) => null);

      // assert
      expect(
        result,
        isInstanceOf<Failure>(),
      );
      verify(baseElectionsDataSource.electionVote(mockElectionVoteParam))
          .called(1);
    });
    test(
        'getSignedInUserDataFromFireStore should return FireStoreUserDataModel on right when success',
        () async {
      // arrange
      when(baseElectionsDataSource.getSignedInUserFromFireStore('uid'))
          .thenAnswer((_) async => mockFireStoreUserDataModel);

      // act
      final result = (await electionsRepositoryImpl
              .getSignedInUserDataFromFireStore('uid'))
          .fold((l) => null, (r) => r);

      // assert
      expect(result, mockFireStoreUserDataModel);
      verify(baseElectionsDataSource.getSignedInUserFromFireStore('uid'))
          .called(1);
    });

    test(
        'getSignedInUserDataFromFireStore should return failure on left when serverException',
        () async {
      // arrange
      when(baseElectionsDataSource.getSignedInUserFromFireStore('uid'))
          .thenThrow(mockServerException);

      // act
      final result = (await electionsRepositoryImpl
              .getSignedInUserDataFromFireStore('uid'))
          .fold((l) => l, (r) => null);

      // assert
      expect(
        result,
        isInstanceOf<Failure>(),
      );
      verify(baseElectionsDataSource.getSignedInUserFromFireStore('uid'))
          .called(1);
    });

    test(
        'updateSignedInUserVoteStatus should return failure on left when serverException',
        () async {
      // arrange
      when(baseElectionsDataSource
              .updateSignedInUserVoteStatus(mockFireStoreUserDataModel))
          .thenThrow(mockServerException);

      // act
      final result = (await electionsRepositoryImpl
              .updateSignedInUserVoteStatus(mockFireStoreUserDataModel))
          .fold((l) => l, (r) => null);

      // assert
      expect(
        result,
        isInstanceOf<Failure>(),
      );
      verify(baseElectionsDataSource
              .updateSignedInUserVoteStatus(mockFireStoreUserDataModel))
          .called(1);
    });
    test(
        'getDocDataAsSnapshot should return failure on left when serverException',
        () async {
      // arrange
      when(baseElectionsDataSource.getDocDataAsSnapshot('collection', 'docId'))
          .thenThrow(mockServerException);

      // act
      final result =
          (electionsRepositoryImpl.getDocDataAsSnapshot('collection', 'docId'))
              .fold((l) => l, (r) => null);

      // assert
      expect(
        result,
        isInstanceOf<Failure>(),
      );
      verify(baseElectionsDataSource.getDocDataAsSnapshot(
              'collection', 'docId'))
          .called(1);
    });
    test('signOut should return failure on left when serverException',
        () async {
      // arrange
      when(baseElectionsDataSource.signOut()).thenThrow(mockServerException);

      // act
      final result =
          (await electionsRepositoryImpl.signOut()).fold((l) => l, (r) => null);

      // assert
      expect(
        result,
        isInstanceOf<Failure>(),
      );
      verify(baseElectionsDataSource.signOut()).called(1);
    });
  });
}
