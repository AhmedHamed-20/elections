// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'registration_cubit.dart';

class DataRegistrationState extends Equatable {
  final String errorMessage;
  final bool isRegistrationsPasswordInVisible;
  final bool isSignInPasswordInVisible;
  final ValidationResponse registrationStatus;
  final File? image;
  final String imageType;
  final BaseRequestStatus isSignedInRequestStatus;
  final bool isUserSignedIn;
  final BaseRequestStatusWithIdleState signInRequestStatus;
  const DataRegistrationState(
      {this.errorMessage = '',
      this.isRegistrationsPasswordInVisible = true,
      this.isSignInPasswordInVisible = true,
      this.signInRequestStatus = BaseRequestStatusWithIdleState.idle,
      this.imageType = '',
      this.isUserSignedIn = false,
      this.isSignedInRequestStatus = BaseRequestStatus.loading,
      this.registrationStatus = ValidationResponse.idle,
      this.image});

  DataRegistrationState copyWith({
    bool? isUserSignedIn,
    bool? isSignInPasswordInVisible,
    BaseRequestStatusWithIdleState? signInRequestStatus,
    BaseRequestStatus? isSignedInRequestStatus,
    String? errorMessage,
    bool? isRegistrationsPasswordInVisible,
    ValidationResponse? registrationStatus,
    String? imageType,
    File? image,
  }) {
    return DataRegistrationState(
      isSignInPasswordInVisible:
          isSignInPasswordInVisible ?? this.isSignInPasswordInVisible,
      signInRequestStatus: signInRequestStatus ?? this.signInRequestStatus,
      isUserSignedIn: isUserSignedIn ?? this.isUserSignedIn,
      isSignedInRequestStatus:
          isSignedInRequestStatus ?? this.isSignedInRequestStatus,
      imageType: imageType ?? this.imageType,
      errorMessage: errorMessage ?? this.errorMessage,
      isRegistrationsPasswordInVisible: isRegistrationsPasswordInVisible ??
          this.isRegistrationsPasswordInVisible,
      registrationStatus: registrationStatus ?? this.registrationStatus,
      image: image ?? this.image,
    );
  }

  @override
  List<Object?> get props => [
        isUserSignedIn,
        isSignInPasswordInVisible,
        signInRequestStatus,
        isSignedInRequestStatus,
        errorMessage,
        imageType,
        isRegistrationsPasswordInVisible,
        registrationStatus,
        image,
      ];
}
