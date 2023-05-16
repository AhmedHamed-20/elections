import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elections/core/constants/app_strings.dart';
import 'package:elections/core/constants/params.dart';
import 'package:elections/core/errors/exceptions.dart';
import 'package:elections/core/services/authFirebaseService/base_auth_service.dart';
import 'package:elections/core/services/firebaseStorageService/base_firebase_storage.dart';
import 'package:elections/core/services/firestoreFirebaseService/base_firestore_service.dart';
import 'package:elections/features/registrations/data/registrations_data_source_impl.dart';
import 'package:elections/features/registrations/models/registration_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'registrations_data_source_impl_test.mocks.dart';

class MockUserCredential extends Mock implements UserCredential {}

class MockFirebaseUser extends Mock implements User {}

class MockQuerySnapshot<T extends Object?> extends Mock
    implements QuerySnapshot {}

@GenerateMocks([BaseFireStoreService, BaseFirebaseStorage, BaseAuthService])
void main() {
  late final BaseFireStoreService fireStoreService;
  late final BaseFirebaseStorage firebaseStorage;
  late final BaseAuthService authService;
  late RegistartionsDataSourceImpl dataSourceImpl;
  const CreateUserParams mockCreateUserParams = CreateUserParams(
    email: 'test@gmail.com',
    name: 'name',
    password: 'password',
    nationalIdNumber: 123456789,
  );

  const FireStoreUserDataModel mockFireStoreUserDataModel =
      FireStoreUserDataModel(
    email: 'email',
    name: 'name',
    uid: 'uid',
    nationalNumber: 123456789,
    identityImageUrl: 'identityImageUrl',
    isVote: false,
  );
  final exception = Exception('Test exception');
  const SignInUserParams mockSignInUserParams =
      SignInUserParams('email', 'password');
  UploadImageToStorageParams mockUploadImageToStorageParams =
      UploadImageToStorageParams(
          imageFile: File('any'), imageType: '.jpg', uid: 'userId');
  setUp(() {
    fireStoreService = MockBaseFireStoreService();
    firebaseStorage = MockBaseFirebaseStorage();
    authService = MockBaseAuthService();
    dataSourceImpl = RegistartionsDataSourceImpl(
        authService, fireStoreService, firebaseStorage);
  });

  group('test registartion remote data source', () {
    test(
        'signUpWithEmailAndPassword should return user UserCredential when success',
        () async {
      // arrange
      final UserCredential userCreadential = MockUserCredential();
      when(authService.createUserWithEmailAndPassword(mockCreateUserParams))
          .thenAnswer((_) async => userCreadential);
      // act
      final result =
          await dataSourceImpl.signUpWithEmailAndPassword(mockCreateUserParams);
      // assert
      expect(result, equals(userCreadential));
      verify(authService.createUserWithEmailAndPassword(mockCreateUserParams))
          .called(1);
    });
    test('signUpWithEmailAndPassword throws ServerException on failure',
        () async {
      when(authService.createUserWithEmailAndPassword(mockCreateUserParams))
          .thenThrow(exception);

      expect(
          () => dataSourceImpl.signUpWithEmailAndPassword(mockCreateUserParams),
          throwsA(isInstanceOf<ServerException>()));

      verify(authService.createUserWithEmailAndPassword(mockCreateUserParams))
          .called(1);
    });

    test('saveUserToFireStore should throw serverException on failure',
        () async {
      when(fireStoreService.saveDataToFireStoreWithId(
              mockFireStoreUserDataModel.toJson(),
              AppStrings.collectionUsers,
              mockFireStoreUserDataModel.uid))
          .thenThrow(exception);

      expect(
          () => dataSourceImpl.saveUserToFireStore(mockFireStoreUserDataModel),
          throwsA(isInstanceOf<ServerException>()));

      verify(fireStoreService.saveDataToFireStoreWithId(
              mockFireStoreUserDataModel.toJson(),
              AppStrings.collectionUsers,
              mockFireStoreUserDataModel.uid))
          .called(1);
    });

    test('uploadIdentityImage should return string when success', () async {
      // arrange
      const String mockImageUrl = 'mockImageUrl';
      when(firebaseStorage.uploadFile(mockUploadImageToStorageParams))
          .thenAnswer((_) async => mockImageUrl);
      // act
      final result = await dataSourceImpl
          .uploadIdentityImage(mockUploadImageToStorageParams);
      // assert
      expect(result, equals(mockImageUrl));
      verify(firebaseStorage.uploadFile(mockUploadImageToStorageParams))
          .called(1);
    });
    test('uploadIdentityImage should throws serverException on failure',
        () async {
      // arrange
      when(firebaseStorage.uploadFile(mockUploadImageToStorageParams))
          .thenThrow(exception);

      expect(
          () => dataSourceImpl
              .uploadIdentityImage(mockUploadImageToStorageParams),
          throwsA(isInstanceOf<ServerException>()));

      verify(firebaseStorage.uploadFile(mockUploadImageToStorageParams))
          .called(1);
    });
    test('checkUserIsSignedIn should return User on success', () async {
      // arrange
      final User user = MockFirebaseUser();
      when(authService.currentUser).thenAnswer((_) async => user);
      // act
      final result = await dataSourceImpl.checkUserIsSignedIn();
      // assert
      expect(result, equals(user));
      verify(authService.currentUser).called(1);
    });
    test('checkUserIsSignedIn should throws serverException on failure',
        () async {
      // arrange
      when(authService.currentUser).thenThrow(exception);

      expect(() => dataSourceImpl.checkUserIsSignedIn(),
          throwsA(isInstanceOf<ServerException>()));

      verify(authService.currentUser).called(1);
    });

    test('signInWithEmailAndPassword should return UserCredential on success',
        () async {
      // arrange
      final UserCredential userCredential = MockUserCredential();
      when(authService.signInWithEmailAndPassword(mockSignInUserParams))
          .thenAnswer((_) async => userCredential);
      // act
      final result =
          await dataSourceImpl.signInWithEmailAndPassword(mockSignInUserParams);
      // assert
      expect(result, equals(userCredential));
      verify(authService.signInWithEmailAndPassword(mockSignInUserParams))
          .called(1);
    });

    test('signInWithEmailAndPassword throws serverException on failure',
        () async {
      // arrange
      when(authService.signInWithEmailAndPassword(mockSignInUserParams))
          .thenThrow(exception);

      expect(
          () => dataSourceImpl.signInWithEmailAndPassword(mockSignInUserParams),
          throwsA(isInstanceOf<ServerException>()));
      verify(authService.signInWithEmailAndPassword(mockSignInUserParams))
          .called(1);
    });
    test('getAllUsersDoc should throw serverException on failure', () async {
      // arrange

      when(fireStoreService.readDataFromFireStore('collectionName'))
          .thenThrow(exception);

      expect(() => dataSourceImpl.getAllUsersDoc('collectionName'),
          throwsA(isInstanceOf<ServerException>()));
      verify(fireStoreService.readDataFromFireStore('collectionName'))
          .called(1);
    });
  });
}
