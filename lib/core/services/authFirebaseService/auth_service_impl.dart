import 'package:firebase_auth/firebase_auth.dart';

import '../../constants/params.dart';
import 'base_auth_service.dart';

class AuthFirebaseService implements BaseAuthService {
  final FirebaseAuth _firebaseAuth;

  AuthFirebaseService(this._firebaseAuth);

  @override
  Future<UserCredential> createUserWithEmailAndPassword(
      CreateUserParams createUserParams) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
      email: createUserParams.email,
      password: createUserParams.password,
    );
  }

  @override
  get currentUser => _firebaseAuth.currentUser;

  @override
  Future<UserCredential> signInWithEmailAndPassword(
      SignInUserParams signInUserParams) async {
    return await _firebaseAuth.signInWithEmailAndPassword(
      email: signInUserParams.email,
      password: signInUserParams.password,
    );
  }
}
