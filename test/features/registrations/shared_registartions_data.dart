import 'dart:io';

import 'package:elections/core/constants/params.dart';
import 'package:elections/core/errors/exceptions.dart';
import 'package:elections/core/errors/server_error_message_model.dart';
import 'package:elections/features/registrations/models/registration_model.dart';

const CreateUserParams mockCreateUserParams = CreateUserParams(
  email: 'test@gmail.com',
  name: 'name',
  password: 'password',
  nationalIdNumber: 123456789,
);

const FireStoreUserDataModel mockFireStoreUserDataModel =
    FireStoreUserDataModel(
  email: 'email',
  name: 'name',
  uid: 'uid',
  nationalNumber: 123456789,
  identityImageUrl: 'identityImageUrl',
  isVote: false,
);
final exception = Exception('Test exception');
const SignInUserParams mockSignInUserParams =
    SignInUserParams('email', 'password');
UploadImageToStorageParams mockUploadImageToStorageParams =
    UploadImageToStorageParams(
        imageFile: File('any'), imageType: '.jpg', uid: 'userId');

ServerException mockServerException = ServerException(
    serverErrorMessageModel: ServerErrorMessageModel.fromException(exception));
