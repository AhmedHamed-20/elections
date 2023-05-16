part of 'elections_cubit.dart';

class ElectionsState extends Equatable {
  final BaseRequestStatus getAvailableElectionsStatus;
  final BaseRequestStatus getSignedInUserStatus;
  final BaseRequestStatus getElectionsDocAsSnapshotStatus;
  final ElectionsModel? electionsModel;
  final String errorMessage;
  final FireStoreUserDataModel? signedInUser;
  final BaseRequestStatusWithIdleState electionVoteStatus;
  final BaseRequestStatusWithIdleState signOutStatus;
  final Stream<DocumentSnapshot<Map<String, dynamic>>>? electionsDocAsSnapshot;
  const ElectionsState({
    this.getAvailableElectionsStatus = BaseRequestStatus.loading,
    this.electionsModel,
    this.signedInUser,
    this.signOutStatus = BaseRequestStatusWithIdleState.idle,
    this.getElectionsDocAsSnapshotStatus = BaseRequestStatus.loading,
    this.getSignedInUserStatus = BaseRequestStatus.loading,
    this.electionVoteStatus = BaseRequestStatusWithIdleState.idle,
    this.errorMessage = '',
    this.electionsDocAsSnapshot,
  });

  ElectionsState copyWith({
    BaseRequestStatusWithIdleState? signOutStatus,
    BaseRequestStatus? getElectionsDocAsSnapshotStatus,
    Stream<DocumentSnapshot<Map<String, dynamic>>>? electionsDocAsSnapshot,
    BaseRequestStatus? getSignedInUserStatus,
    FireStoreUserDataModel? signedInUser,
    BaseRequestStatus? getAvailableElectionsStatus,
    ElectionsModel? electionsModel,
    BaseRequestStatusWithIdleState? electionVoteStatus,
    String? errorMessage,
  }) {
    return ElectionsState(
      signOutStatus: signOutStatus ?? this.signOutStatus,
      getElectionsDocAsSnapshotStatus: getElectionsDocAsSnapshotStatus ??
          this.getElectionsDocAsSnapshotStatus,
      electionsDocAsSnapshot:
          electionsDocAsSnapshot ?? this.electionsDocAsSnapshot,
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
        signOutStatus,
        getElectionsDocAsSnapshotStatus,
        electionsDocAsSnapshot,
        getSignedInUserStatus,
        signedInUser,
        getAvailableElectionsStatus,
        electionsModel,
        errorMessage,
        electionVoteStatus,
      ];
}
