import 'package:elections/core/errors/server_error_message_model.dart';

class ServerException implements Exception {
  final ServerErrorMessageModel serverErrorMessageModel;

  const ServerException({required this.serverErrorMessageModel});
}
