import 'package:elections/core/constants/params.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuthService {
  Future<UserCredential> signInWithEmailAndPassword(
      SignInUserParams signInUserParams);
  Future<UserCredential> createUserWithEmailAndPassword(
      CreateUserParams createUserParams);
  get currentUser;

  Future<void> signOut();
}
