import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elections/core/services/firestoreFirebaseService/base_firestore_service.dart';

class FireStoreServiceImpl implements BaseFireStoreService {
  final FirebaseFirestore _firebaseFirestore;

  FireStoreServiceImpl(this._firebaseFirestore);
  @override
  Future<void> saveDataToFireStore(Map<String, dynamic> saveDataToFireStoreMap,
      String collectionName, String collectionDocId) async {
    return await _firebaseFirestore
        .collection(collectionName)
        .doc(collectionDocId)
        .set(saveDataToFireStoreMap);
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> readDataFromFireStore(
      String collectionName) async {
    return await _firebaseFirestore.collection(collectionName).get();
  }

  @override
  Future updateDataToFireStore(Map<String, dynamic> updateDataToFireStoreMap,
      String collectionName, String collectionDocId) async {
    return await _firebaseFirestore
        .collection(collectionName)
        .doc(collectionDocId)
        .update(updateDataToFireStoreMap);
  }
}
