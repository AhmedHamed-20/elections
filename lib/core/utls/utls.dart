enum ValidationResponse {
  idle,
  loading,
  userCreatedSuccess,
  userIdentityPhotoUploadedSuccess,
  userDataSavedToFireStoreSuccess,
  registrationSuccess,
  error,
}

enum BaseRequestStatusWithIdleState {
  idle,
  loading,
  success,
  error,
}

enum BaseRequestStatus {
  loading,
  success,
  error,
}
