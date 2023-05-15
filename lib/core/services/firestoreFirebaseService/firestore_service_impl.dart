import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elections/core/constants/app_strings.dart';
import 'package:elections/core/services/firestoreFirebaseService/base_firestore_service.dart';

import '../../../features/registrations/models/registration_model.dart';

class FireStoreServiceImpl implements BaseFireStoreService {
  final FirebaseFirestore _firebaseFirestore;

  FireStoreServiceImpl(this._firebaseFirestore);
  @override
  Future<void> saveUserToFireStore(
      SaveUserToFireStoreModel saveUserToFireStoreModel) async {
    return await _firebaseFirestore
        .collection(AppStrings.collectionUsers)
        .doc(saveUserToFireStoreModel.uid)
        .set(saveUserToFireStoreModel.toJsonWithoutUid());
  }
}
