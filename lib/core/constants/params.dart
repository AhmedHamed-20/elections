import 'dart:io';

import 'package:equatable/equatable.dart';

class CreateUserParams extends Equatable {
  final String email;
  final String password;
  final int nationalIdNumber;
  final String name;
  const CreateUserParams(
      {required this.email,
      required this.password,
      required this.nationalIdNumber,
      required this.name});

  @override
  List<Object?> get props => [email, password, nationalIdNumber, name];
}

class SignInUserParams extends Equatable {
  final String email;
  final String password;
  const SignInUserParams(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}

class UploadImageToStorageParams extends Equatable {
  final String uid;
  final File imageFile;
  final String imageType;
  const UploadImageToStorageParams(
      {required this.uid, required this.imageFile, required this.imageType});

  @override
  List<Object?> get props => [uid, imageFile, imageType];
}

class ElectionVoteParam extends Equatable {
  final int nationalIdNumber;
  final String candidateName;
  final String uid;
  const ElectionVoteParam(
      {required this.nationalIdNumber,
      required this.candidateName,
      required this.uid});

  Map<String, dynamic> toJson() {
    return {
      'nationalIdNumber': nationalIdNumber,
      'candidateName': candidateName,
      'uid': uid,
    };
  }

  @override
  List<Object?> get props => [nationalIdNumber, candidateName, uid];
}
