// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'registration_cubit.dart';

class DataRegistrationState extends Equatable {
  final String errorMessage;
  final bool isPasswordVisible;
  final ValidationResponse registrationStatus;
  final File? image;
  final String imageType;
  final BaseRequestStatus isSignedInRequestStatus;
  final bool isUserSignedIn;
  const DataRegistrationState(
      {this.errorMessage = '',
      this.isPasswordVisible = true,
      this.imageType = '',
      this.isUserSignedIn = false,
      this.isSignedInRequestStatus = BaseRequestStatus.loading,
      this.registrationStatus = ValidationResponse.idle,
      this.image});

  DataRegistrationState copyWith({
    bool? isUserSignedIn,
    BaseRequestStatus? isSignedInRequestStatus,
    String? errorMessage,
    bool? isPasswordVisible,
    ValidationResponse? registrationStatus,
    String? imageType,
    File? image,
  }) {
    return DataRegistrationState(
      isUserSignedIn: isUserSignedIn ?? this.isUserSignedIn,
      isSignedInRequestStatus:
          isSignedInRequestStatus ?? this.isSignedInRequestStatus,
      imageType: imageType ?? this.imageType,
      errorMessage: errorMessage ?? this.errorMessage,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      registrationStatus: registrationStatus ?? this.registrationStatus,
      image: image ?? this.image,
    );
  }

  @override
  List<Object?> get props => [
        isUserSignedIn,
        isSignedInRequestStatus,
        errorMessage,
        imageType,
        isPasswordVisible,
        registrationStatus,
        image,
      ];
}
