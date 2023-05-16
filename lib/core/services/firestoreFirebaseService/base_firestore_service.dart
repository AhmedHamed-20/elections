import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BaseFireStoreService {
  Future<void> saveDataToFireStore(Map<String, dynamic> saveDataToFireStoreMap,
      String collectionName, String collectionDocId);

  Future<QuerySnapshot<Map<String, dynamic>>> readDataFromFireStore(
    String collectionName,
  );

  Future updateDataToFireStore(Map<String, dynamic> updateDataToFireStoreMap,
      String collectionName, String collectionDocId);

  Stream<DocumentSnapshot<Map<String, dynamic>>> getDocDataAsSnapshot(
    String collectionName,
    String collectionDocId,
  );
}
