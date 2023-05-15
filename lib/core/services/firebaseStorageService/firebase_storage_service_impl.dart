import 'package:elections/core/constants/app_strings.dart';
import 'package:elections/core/constants/params.dart';
import 'package:elections/core/services/firebaseStorageService/base_firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageServiceImpl implements BaseFirebaseStorage {
  final FirebaseStorage _firebaseStorage;

  const FirebaseStorageServiceImpl(this._firebaseStorage);

  @override
  Future<String> uploadFile(
      UploadImageToStorageParams uploadImageToStorageParams) async {
    Reference reference = _firebaseStorage
        .ref()
        .child(AppStrings.firebaseStorageUserImagesPath)
        .child(uploadImageToStorageParams.uid +
            uploadImageToStorageParams.imageType);
    UploadTask uploadTask =
        reference.putFile(uploadImageToStorageParams.imageFile);
    TaskSnapshot taskSnapshot = await uploadTask;
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}
