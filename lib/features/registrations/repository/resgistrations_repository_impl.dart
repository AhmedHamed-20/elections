import 'package:elections/core/errors/exceptions.dart';
import 'package:elections/features/registrations/data/base_registrations_data_source.dart';
import 'package:elections/features/registrations/models/registration_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:elections/core/errors/failures.dart';

import 'package:elections/core/constants/params.dart';

import 'package:dartz/dartz.dart';

import 'base_registrations_repository.dart';

class RegistrationsRepositoryImpl implements BaseRegistrationsRepository {
  final BaseRegistrationsDataSource _baseRegistrationsDataSource;

  const RegistrationsRepositoryImpl(this._baseRegistrationsDataSource);
  @override
  Future<Either<Failure, UserCredential>> signUpWithEmailAndPassword(
      CreateUserParams params) async {
    try {
      final result =
          await _baseRegistrationsDataSource.signUpWithEmailAndPassword(params);
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          message: e.serverErrorMessageModel.message,
          statusCode: e.serverErrorMessageModel.statusCode,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> saveUserToFireStore(
      SaveUserToFireStoreModel saveUserToFireStoreModel) async {
    try {
      final result = await _baseRegistrationsDataSource
          .saveUserToFireStore(saveUserToFireStoreModel);
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          message: e.serverErrorMessageModel.message,
          statusCode: e.serverErrorMessageModel.statusCode,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, String>> uploadIdentityImage(
      UploadImageToStorageParams params) async {
    try {
      final result =
          await _baseRegistrationsDataSource.uploadIdentityImage(params);
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          message: e.serverErrorMessageModel.message,
          statusCode: e.serverErrorMessageModel.statusCode,
        ),
      );
    }
  }
}
