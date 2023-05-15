import 'package:dartz/dartz.dart';
import 'package:elections/core/errors/failures.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/constants/params.dart';
import '../models/registration_model.dart';

abstract class BaseRegistrationsRepository {
  Future<Either<Failure, UserCredential>> signUpWithEmailAndPassword(
      CreateUserParams params);

  Future<Either<Failure, void>> saveUserToFireStore(
      SaveUserToFireStoreModel saveUserToFireStoreModel);
  Future<Either<Failure, String>> uploadIdentityImage(
      UploadImageToStorageParams params);
}
