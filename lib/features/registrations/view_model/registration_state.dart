// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'registration_cubit.dart';

class DataRegistrationState extends Equatable {
  final String errorMessage;
  final bool isPasswordVisible;
  final ValidationResponse registrationStatus;
  final File? image;
  const DataRegistrationState(
      {this.errorMessage = '',
      this.isPasswordVisible = true,
      this.registrationStatus = ValidationResponse.idle,
      this.image});

  DataRegistrationState copyWith({
    String? errorMessage,
    bool? isPasswordVisible,
    ValidationResponse? registrationStatus,
    File? image,
  }) {
    return DataRegistrationState(
      errorMessage: errorMessage ?? this.errorMessage,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      registrationStatus: registrationStatus ?? this.registrationStatus,
      image: image ?? this.image,
    );
  }

  @override
  List<Object?> get props => [
        errorMessage,
        isPasswordVisible,
        registrationStatus,
        image,
      ];
}
