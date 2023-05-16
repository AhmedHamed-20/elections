import 'package:elections/core/errors/exceptions.dart';
import 'package:elections/core/errors/failures.dart';
import 'package:elections/features/registrations/data/base_registrations_data_source.dart';
import 'package:elections/features/registrations/repository/registrations_repository_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../shared_registartions_data.dart';
import 'registrations_repository_impl_test.mocks.dart';

class MockUserCredential extends Mock implements UserCredential {}

class MockFirebaseUser extends Mock implements User {}

@GenerateMocks([BaseRegistrationsDataSource])
void main() {
  late final BaseRegistrationsDataSource baseRegistrationsDataSource;
  late final RegistrationsRepositoryImpl registrationsRepositoryImpl;
  final UserCredential mockUserCredential = MockUserCredential();
  setUp(() {
    baseRegistrationsDataSource = MockBaseRegistrationsDataSource();
    registrationsRepositoryImpl =
        RegistrationsRepositoryImpl(baseRegistrationsDataSource);
  });

  group('test Registrations repository', () {
    test(
        'signUpWithEmailAndPassword should return UserCredential on right when success',
        () async {
      // arrange
      when(baseRegistrationsDataSource
              .signUpWithEmailAndPassword(mockCreateUserParams))
          .thenAnswer((_) async => mockUserCredential);
      // act
      final result = (await registrationsRepositoryImpl
              .signUpWithEmailAndPassword(mockCreateUserParams))
          .fold((l) => null, (r) => r);

      // assert
      expect(result, equals(mockUserCredential));
      verify(baseRegistrationsDataSource
              .signUpWithEmailAndPassword(mockCreateUserParams))
          .called(1);
    });

    test(
        'signUpWithEmailAndPassword return serverFailure on left when throw serverException',
        () async {
      when(baseRegistrationsDataSource
              .signUpWithEmailAndPassword(mockCreateUserParams))
          .thenThrow(mockServerException);

      final result = (await registrationsRepositoryImpl
              .signUpWithEmailAndPassword(mockCreateUserParams))
          .fold((l) => l, (r) => null);

      expect(
        result,
        isInstanceOf<Failure>(),
      );
      verify(baseRegistrationsDataSource
              .signUpWithEmailAndPassword(mockCreateUserParams))
          .called(1);
    });

    test(
        'saveUserToFireStore return serverFailure on left when throw serverException',
        () async {
      when(baseRegistrationsDataSource
              .saveUserToFireStore(mockFireStoreUserDataModel))
          .thenThrow(mockServerException);

      final result = (await registrationsRepositoryImpl
              .saveUserToFireStore(mockFireStoreUserDataModel))
          .fold((l) => l, (r) => null);
      expect(result, isInstanceOf<Failure>());
      verify(baseRegistrationsDataSource
              .saveUserToFireStore(mockFireStoreUserDataModel))
          .called(1);
    });

    test('uploadIdentityImage should return string when success', () async {
      // arrange
      const String mockImageUrl = 'mockImageUrl';
      when(baseRegistrationsDataSource
              .uploadIdentityImage(mockUploadImageToStorageParams))
          .thenAnswer((_) async => mockImageUrl);
      // act
      final result = (await registrationsRepositoryImpl
              .uploadIdentityImage(mockUploadImageToStorageParams))
          .fold((l) => null, (r) => r);
      // assert
      expect(result, equals(mockImageUrl));
      verify(baseRegistrationsDataSource
              .uploadIdentityImage(mockUploadImageToStorageParams))
          .called(1);
    });

    test(
        'uploadIdentityImage should return failure when throws serverException',
        () async {
      // arrange
      when(baseRegistrationsDataSource
              .uploadIdentityImage(mockUploadImageToStorageParams))
          .thenThrow(mockServerException);
      // act
      final result = (await registrationsRepositoryImpl
              .uploadIdentityImage(mockUploadImageToStorageParams))
          .fold((l) => l, (r) => null);
      // assert
      expect(result, isInstanceOf<Failure>());
      verify(baseRegistrationsDataSource
              .uploadIdentityImage(mockUploadImageToStorageParams))
          .called(1);
    });

    test('checkUserIsSignedIn should return User on success', () async {
      // arrange
      final User user = MockFirebaseUser();
      when(baseRegistrationsDataSource.checkUserIsSignedIn())
          .thenAnswer((_) async => user);
      // act
      final result = (await registrationsRepositoryImpl.checkUserIsSignedIn())
          .fold((l) => null, (r) => r);
      // assert
      expect(result, equals(user));
      verify(baseRegistrationsDataSource.checkUserIsSignedIn()).called(1);
    });

    test('checkUserIsSignedIn should return failure when throw ServerException',
        () async {
      // arrange
      when(baseRegistrationsDataSource.checkUserIsSignedIn())
          .thenThrow(mockServerException);
      // act
      final result = (await registrationsRepositoryImpl.checkUserIsSignedIn())
          .fold((l) => l, (r) => null);
      // assert
      expect(result, isInstanceOf<Failure>());
      verify(baseRegistrationsDataSource.checkUserIsSignedIn()).called(1);
    });

    test(
        'signInWithEmailAndPassword should return UserCredential on right when success',
        () async {
      // arrange
      when(baseRegistrationsDataSource
              .signInWithEmailAndPassword(mockSignInUserParams))
          .thenAnswer((_) async => mockUserCredential);
      // act
      final result = (await registrationsRepositoryImpl
              .signInWithEmailAndPassword(mockSignInUserParams))
          .fold((l) => null, (r) => r);

      // assert
      expect(result, equals(mockUserCredential));
      verify(baseRegistrationsDataSource
              .signInWithEmailAndPassword(mockSignInUserParams))
          .called(1);
    });

    test(
        'signInWithEmailAndPassword should return failure on left when throw serverException',
        () async {
      // arrange
      when(baseRegistrationsDataSource
              .signInWithEmailAndPassword(mockSignInUserParams))
          .thenThrow(mockServerException);
      // act
      final result = (await registrationsRepositoryImpl
              .signInWithEmailAndPassword(mockSignInUserParams))
          .fold((l) => l, (r) => null);

      // assert
      expect(result, isInstanceOf<Failure>());
      verify(baseRegistrationsDataSource
              .signInWithEmailAndPassword(mockSignInUserParams))
          .called(1);
    });

    test(
        'getAllUsersDoc should return failure on left when throw serverException',
        () async {
      // arrange
      when(baseRegistrationsDataSource.getAllUsersDoc('mockCollectionPath'))
          .thenThrow(mockServerException);
      // act
      final result = (await registrationsRepositoryImpl
              .getAllUsersDoc('mockCollectionPath'))
          .fold((l) => l, (r) => null);

      // assert
      expect(result, isInstanceOf<Failure>());
      verify(baseRegistrationsDataSource.getAllUsersDoc('mockCollectionPath'))
          .called(1);
    });
  });
}
