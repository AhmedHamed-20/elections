import 'package:elections/core/constants/params.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/registration_model.dart';

abstract class BaseRegistrationsDataSource {
  Future<UserCredential> signUpWithEmailAndPassword(CreateUserParams params);
  Future<void> saveUserToFireStore(
      SaveUserToFireStoreModel saveUserToFireStoreModel);
  Future<String> uploadIdentityImage(UploadImageToStorageParams params);
}
