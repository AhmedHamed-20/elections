import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:elections/core/errors/failures.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/constants/params.dart';
import '../models/registration_model.dart';

abstract class BaseRegistrationsRepository {
  Future<Either<Failure, UserCredential>> signUpWithEmailAndPassword(
      CreateUserParams params);
  Future<Either<Failure, UserCredential>> signInWithEmailAndPassword(
      SignInUserParams params);
  Future<Either<Failure, void>> saveUserToFireStore(
      FireStoreUserDataModel saveUserToFireStoreModel);
  Future<Either<Failure, String>> uploadIdentityImage(
      UploadImageToStorageParams params);
  Future<Either<Failure, User?>> checkUserIsSignedIn();
  Future<Either<Failure, QuerySnapshot<Map<String, dynamic>>>> getAllUsersDoc(
      String collectionName);
}
