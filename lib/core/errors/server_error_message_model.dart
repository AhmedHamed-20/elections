import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ServerErrorMessageModel extends Equatable {
  final String message;
  final int? statusCode;
  const ServerErrorMessageModel({
    required this.message,
    this.statusCode,
  });

  factory ServerErrorMessageModel.fromException(Exception exception) {
    if (exception is FirebaseException) {
      return ServerErrorMessageModel(
          message: exception.message!,
          statusCode: int.tryParse(exception.code));
    } else {
      return ServerErrorMessageModel(
        message: exception.toString(),
      );
    }
  }

  @override
  List<Object?> get props => [
        message,
        statusCode,
      ];
}
