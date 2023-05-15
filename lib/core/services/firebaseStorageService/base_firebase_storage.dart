import '../../constants/params.dart';

abstract class BaseFirebaseStorage {
  Future<String> uploadFile(
      UploadImageToStorageParams uploadImageToStorageParams);
}
