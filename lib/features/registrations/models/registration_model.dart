// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class FireStoreUserDataModel extends Equatable {
  final String email;
  final String name;
  final String uid;
  final int nationalNumber;
  final String identityImageUrl;
  final bool isVote;
  const FireStoreUserDataModel(
      {required this.email,
      required this.name,
      required this.uid,
      required this.nationalNumber,
      required this.identityImageUrl,
      required this.isVote});

  factory FireStoreUserDataModel.fromJson(Map<String, dynamic> json) {
    return FireStoreUserDataModel(
      email: json['email'] as String,
      name: json['name'] as String,
      uid: json['uid'] as String,
      isVote: json['isVote'] as bool,
      nationalNumber: json['nationalNumber'] as int,
      identityImageUrl: json['identityImageUrl'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'uid': uid,
      'isVote': isVote,
      'nationalNumber': nationalNumber,
      'identityImageUrl': identityImageUrl,
    };
  }

  FireStoreUserDataModel copyWith({
    String? email,
    String? name,
    String? uid,
    int? nationalNumber,
    String? identityImageUrl,
    bool? isVote,
  }) {
    return FireStoreUserDataModel(
      email: email ?? this.email,
      name: name ?? this.name,
      uid: uid ?? this.uid,
      nationalNumber: nationalNumber ?? this.nationalNumber,
      identityImageUrl: identityImageUrl ?? this.identityImageUrl,
      isVote: isVote ?? this.isVote,
    );
  }

  @override
  List<Object?> get props =>
      [email, name, uid, nationalNumber, identityImageUrl, isVote];
}
