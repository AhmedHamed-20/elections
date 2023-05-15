import 'package:equatable/equatable.dart';

class SaveUserToFireStoreModel extends Equatable {
  final String email;
  final String name;
  final String uid;
  final int nationalNumber;
  final String identityImageUrl;

  const SaveUserToFireStoreModel(this.email, this.name, this.uid,
      this.nationalNumber, this.identityImageUrl);

  factory SaveUserToFireStoreModel.fromJson(Map<String, dynamic> json) {
    return SaveUserToFireStoreModel(
      json['email'] as String,
      json['name'] as String,
      json['uid'] as String,
      json['nationalNumber'] as int,
      json['identityImageUrl'] as String,
    );
  }
  Map<String, dynamic> toJsonWithoutUid() {
    return {
      'email': email,
      'name': name,
      'nationalNumber': nationalNumber,
      'identityImageUrl': identityImageUrl,
    };
  }

  @override
  List<Object?> get props =>
      [email, name, uid, nationalNumber, identityImageUrl];
}
