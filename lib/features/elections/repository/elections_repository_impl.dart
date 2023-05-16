import 'package:dartz/dartz.dart';
import 'package:elections/core/constants/params.dart';
import 'package:elections/core/errors/exceptions.dart';
import 'package:elections/core/errors/failures.dart';
import 'package:elections/features/elections/data/base_elections_data_source.dart';
import 'package:elections/features/elections/models/elections_model.dart';
import 'package:elections/features/elections/repository/base_elections_repository.dart';
import 'package:elections/features/registrations/models/registration_model.dart';

class ElectionsRepositoryImpl implements BaseElectionsRepository {
  final BaseElectionsDataSource _electionsDataSource;

  const ElectionsRepositoryImpl(this._electionsDataSource);
  @override
  Future<Either<Failure, ElectionsModel>> getAvailableElections() async {
    try {
      final result = await _electionsDataSource.getAvailableElections();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(
          message: e.serverErrorMessageModel.message,
          statusCode: e.serverErrorMessageModel.statusCode));
    }
  }

  @override
  Future<Either<Failure, void>> electionVote(
      ElectionVoteParam electionVoteParam) async {
    try {
      final result = await _electionsDataSource.electionVote(electionVoteParam);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(
          message: e.serverErrorMessageModel.message,
          statusCode: e.serverErrorMessageModel.statusCode));
    }
  }

  @override
  Future<Either<Failure, FireStoreUserDataModel>>
      getSignedInUserDataFromFireStore(String uid) async {
    try {
      return Right(
          await _electionsDataSource.getSignedInUserFromFireStore(uid));
    } on ServerException catch (e) {
      return Left(ServerFailure(
          message: e.serverErrorMessageModel.message,
          statusCode: e.serverErrorMessageModel.statusCode));
    }
  }

  @override
  Future<Either<Failure, void>> updateSignedInUserVoteStatus(
      FireStoreUserDataModel newUserData) async {
    try {
      final result =
          await _electionsDataSource.updateSignedInUserVoteStatus(newUserData);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(
          message: e.serverErrorMessageModel.message,
          statusCode: e.serverErrorMessageModel.statusCode));
    }
  }
}
