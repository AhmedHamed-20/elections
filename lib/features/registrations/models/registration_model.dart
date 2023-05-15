import 'package:equatable/equatable.dart';

class SaveUserToFireStoreModel extends Equatable {
  final String email;
  final String name;
  final String uid;
  final int nationalNumber;
  final String identityImageUrl;

  const SaveUserToFireStoreModel(
      {required this.email,
      required this.name,
      required this.uid,
      required this.nationalNumber,
      required this.identityImageUrl});

  factory SaveUserToFireStoreModel.fromJson(Map<String, dynamic> json) {
    return SaveUserToFireStoreModel(
      email: json['email'] as String,
      name: json['name'] as String,
      uid: json['uid'] as String,
      nationalNumber: json['nationalNumber'] as int,
      identityImageUrl: json['identityImageUrl'] as String,
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
