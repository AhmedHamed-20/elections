import 'dart:io';

class CreateUserParams {
  final String email;
  final String password;
  const CreateUserParams(this.email, this.password);
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
  const UploadImageToStorageParams(this.uid, this.imageFile, this.imageType);
}
