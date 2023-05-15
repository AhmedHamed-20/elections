import 'dart:io';

class CreateUserParams {
  final String email;
  final String password;
  final int nationalIdNumber;
  final String name;
  const CreateUserParams(
      {required this.email,
      required this.password,
      required this.nationalIdNumber,
      required this.name});
}

class SignInUserParams {
  final String email;
  final String password;
  const SignInUserParams(this.email, this.password);
}

class UploadImageToStorageParams {
  final String uid;
  final File imageFile;
  final String imageType;
  const UploadImageToStorageParams(
      {required this.uid, required this.imageFile, required this.imageType});
}
