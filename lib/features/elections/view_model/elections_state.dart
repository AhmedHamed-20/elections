part of 'elections_cubit.dart';

class ElectionsState extends Equatable {
  final BaseRequestStatus getAvailableElectionsStatus;
  final BaseRequestStatus getSignedInUserStatus;
  final ElectionsModel? electionsModel;
  final String errorMessage;
  final FireStoreUserDataModel? signedInUser;
  final BaseRequestStatusWithIdleState electionVoteStatus;
  const ElectionsState({
    this.getAvailableElectionsStatus = BaseRequestStatus.loading,
    this.electionsModel,
    this.signedInUser,
    this.getSignedInUserStatus = BaseRequestStatus.loading,
    this.electionVoteStatus = BaseRequestStatusWithIdleState.idle,
    this.errorMessage = '',
  });

  ElectionsState copyWith({
    BaseRequestStatus? getSignedInUserStatus,
    FireStoreUserDataModel? signedInUser,
    BaseRequestStatus? getAvailableElectionsStatus,
    ElectionsModel? electionsModel,
    BaseRequestStatusWithIdleState? electionVoteStatus,
    String? errorMessage,
  }) {
    return ElectionsState(
      getSignedInUserStatus:
          getSignedInUserStatus ?? this.getSignedInUserStatus,
      signedInUser: signedInUser ?? this.signedInUser,
      electionVoteStatus: electionVoteStatus ?? this.electionVoteStatus,
      getAvailableElectionsStatus:
          getAvailableElectionsStatus ?? this.getAvailableElectionsStatus,
      electionsModel: electionsModel ?? this.electionsModel,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        getSignedInUserStatus,
        signedInUser,
        getAvailableElectionsStatus,
        electionsModel,
        errorMessage,
        electionVoteStatus,
      ];
}
