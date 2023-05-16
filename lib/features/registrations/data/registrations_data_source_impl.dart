import 'package:elections/core/constants/app_strings.dart';
import 'package:elections/core/constants/params.dart';
import 'package:elections/core/errors/exceptions.dart';
import 'package:elections/core/errors/server_error_message_model.dart';
import 'package:elections/core/services/authFirebaseService/base_auth_service.dart';
import 'package:elections/core/services/firebaseStorageService/base_firebase_storage.dart';
import 'package:elections/core/services/firestoreFirebaseService/base_firestore_service.dart';
import 'package:elections/features/registrations/data/base_registrations_data_source.dart';
import 'package:elections/features/registrations/models/registration_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistartionsDataSourceImpl implements BaseRegistrationsDataSource {
  final BaseAuthService _baseAuthService;
  final BaseFireStoreService _baseFireStoreService;
  final BaseFirebaseStorage _baseFirebaseStorage;
  const RegistartionsDataSourceImpl(this._baseAuthService,
      this._baseFireStoreService, this._baseFirebaseStorage);

  @override
  Future<UserCredential> signUpWithEmailAndPassword(
      CreateUserParams params) async {
    try {
      final result =
          await _baseAuthService.createUserWithEmailAndPassword(params);
      return result;
    } on Exception catch (e) {
      throw ServerException(
        serverErrorMessageModel: ServerErrorMessageModel.fromException(e),
      );
    }
  }

  @override
  Future<void> saveUserToFireStore(
      FireStoreUserDataModel saveUserToFireStoreModel) async {
    try {
      return await _baseFireStoreService.saveDataToFireStore(
          saveUserToFireStoreModel.toJson(),
          AppStrings.collectionUsers,
          saveUserToFireStoreModel.uid);
    } on Exception catch (e) {
      throw ServerException(
        serverErrorMessageModel: ServerErrorMessageModel.fromException(e),
      );
    }
  }

  @override
  Future<String> uploadIdentityImage(UploadImageToStorageParams params) async {
    try {
      return await _baseFirebaseStorage.uploadFile(params);
    } on Exception catch (e) {
      throw ServerException(
        serverErrorMessageModel: ServerErrorMessageModel.fromException(e),
      );
    }
  }

  @override
  Future<User?> checkUserIsSignedIn() async {
    try {
      return await _baseAuthService.currentUser;
    } on Exception catch (e) {
      throw ServerException(
        serverErrorMessageModel: ServerErrorMessageModel.fromException(e),
      );
    }
  }
}
